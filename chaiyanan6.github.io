<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NovaCards - Premium Trading Card Shop</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-deep: #030712;
            --bg-surface: #0A0F1E;
            --accent-glow: #06B6D4;
            --accent-secondary: #8B5CF6;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-deep);
            background-image: 
                radial-gradient(ellipse at top right, rgba(6, 182, 212, 0.1), transparent 50%),
                radial-gradient(ellipse at bottom left, rgba(139, 92, 246, 0.08), transparent 50%);
            color: #F8FAFC;
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar { width: 6px; }
        ::-webkit-scrollbar-track { background: var(--bg-deep); }
        ::-webkit-scrollbar-thumb { background: #334155; border-radius: 3px; }

        /* Glassmorphism Panel */
        .glass-panel {
            background: rgba(15, 23, 42, 0.6);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.08);
        }

        /* Glow Effects */
        .glow-text {
            text-shadow: 0 0 20px rgba(6, 182, 212, 0.5);
        }

        .glow-border {
            box-shadow: 0 0 20px rgba(6, 182, 212, 0.2), inset 0 0 20px rgba(6, 182, 212, 0.05);
        }

        /* Card Hover Effect */
        .card-item {
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .card-item:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(6, 182, 212, 0.2);
        }

        /* Limited Edition Badge */
        .limited-badge {
            background: linear-gradient(135deg, var(--accent-glow), var(--accent-secondary));
            animation: pulse-glow 2s ease-in-out infinite;
        }

        @keyframes pulse-glow {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.7; }
        }

        /* Cart Slide Animation */
        .cart-panel {
            transition: transform 0.4s cubic-bezier(0.16, 1, 0.3, 1);
        }

        /* Filter Button Active State */
        .filter-btn.active {
            background: linear-gradient(135deg, var(--accent-glow), #0891B2);
            color: white;
            border-color: transparent;
        }

        /* Cosmic Dots Pattern */
        .cosmic-pattern {
            background-image: radial-gradient(rgba(255, 255, 255, 0.1) 1px, transparent 1px);
            background-size: 24px 24px;
        }
    </style>
</head>
<body class="min-h-screen">

    <!-- Navigation -->
    <nav class="fixed top-0 left-0 right-0 z-50 glass-panel border-b border-white/5">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 h-16 flex items-center justify-between">
            <!-- Logo -->
            <div class="flex items-center gap-2">
                <div class="w-8 h-8 rounded-lg bg-gradient-to-br from-cyan-400 to-blue-600 flex items-center justify-center">
                    <i data-lucide="layers" class="w-5 h-5 text-white"></i>
                </div>
                <span class="text-lg font-semibold tracking-tight">Nova<span class="text-cyan-400">Cards</span></span>
            </div>

            <!-- Search Bar (Desktop) -->
            <div class="hidden md:flex flex-1 max-w-md mx-8">
                <div class="relative w-full">
                    <input type="text" placeholder="ค้นหาการ์ด, เซ็ต, หรือนักสะสม..." 
                           class="w-full bg-slate-900/50 border border-white/10 rounded-lg px-4 py-2 pl-10 text-sm focus:outline-none focus:border-cyan-500/50 transition-colors">
                    <i data-lucide="search" class="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400"></i>
                </div>
            </div>

            <!-- Actions -->
            <div class="flex items-center gap-3">
                <button class="hidden sm:flex items-center gap-2 px-4 py-2 text-sm text-slate-300 hover:text-white transition-colors">
                    <i data-lucide="heart" class="w-4 h-4"></i>
                    <span>Wishlist</span>
                </button>
                <button onclick="toggleCart()" class="relative p-2 rounded-lg hover:bg-white/5 transition-colors">
                    <i data-lucide="shopping-bag" class="w-5 h-5"></i>
                    <span id="cart-count" class="absolute -top-1 -right-1 w-5 h-5 bg-cyan-500 rounded-full text-xs font-medium flex items-center justify-center">2</span>
                </button>
                <button class="p-2 rounded-lg hover:bg-white/5 transition-colors md:hidden">
                    <i data-lucide="menu" class="w-5 h-5"></i>
                </button>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="pt-24 pb-16 px-4 relative overflow-hidden">
        <!-- Background Glow Orbs -->
        <div class="absolute top-20 left-10 w-72 h-72 bg-cyan-500/20 rounded-full blur-[100px] pointer-events-none"></div>
        <div class="absolute bottom-0 right-10 w-96 h-96 bg-purple-500/10 rounded-full blur-[120px] pointer-events-none"></div>
        
        <div class="max-w-7xl mx-auto">
            <!-- Limited Edition Banner -->
            <div class="relative rounded-2xl overflow-hidden mb-12 glow-border">
                <div class="absolute inset-0 cosmic-pattern opacity-30"></div>
                <div class="relative glass-panel p-8 md:p-12 flex flex-col lg:flex-row items-center gap-8">
                    <div class="flex-1 text-center lg:text-left">
                        <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full limited-badge text-xs font-semibold uppercase tracking-wider mb-4">
                            <i data-lucide="sparkles" class="w-3 h-3"></i>
                            Limited Edition
                        </div>
                        <h1 class="text-3xl md:text-5xl font-bold mb-4 leading-tight">
                            คอลเลกชัน <span class="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-blue-500 glow-text">Celestial Dragons</span>
                        </h1>
                        <p class="text-slate-400 text-lg mb-6 max-w-xl">
                            เซ็ตการ์ดลิมิเต็ดครั้งแรกที่ออกแบบด้วยเทคโนโลยี Holographic 3D แบบพิเศษ เหลือเพียง <span class="text-cyan-400 font-semibold">50 เซ็ท</span> ในประเทศไทย
                        </p>
                        <div class="flex flex-col sm:flex-row gap-3 justify-center lg:justify-start">
                            <button class="px-6 py-3 bg-gradient-to-r from-cyan-500 to-blue-600 rounded-lg font-medium hover:opacity-90 transition-opacity flex items-center justify-center gap-2">
                                <i data-lucide="zap" class="w-4 h-4"></i>
                                สั่งจองเลย
                            </button>
                            <button class="px-6 py-3 border border-white/10 rounded-lg font-medium hover:bg-white/5 transition-colors">
                                ดูตัวอย่าง
                            </button>
                        </div>
                    </div>
                    <div class="flex-shrink-0">
                        <div class="relative w-64 h-80 md:w-72 md:h-96">
                            <img src="https://picsum.photos/seed/dragoncard/320/420" alt="Featured Card" 
                                 class="w-full h-full object-cover rounded-xl shadow-2xl ring-1 ring-white/10">
                            <div class="absolute inset-0 rounded-xl bg-gradient-to-t from-black/50 to-transparent"></div>
                            <div class="absolute bottom-4 left-4 right-4">
                                <div class="text-xs text-cyan-400 font-medium mb-1">Rarity: Legendary</div>
                                <div class="text-white font-semibold">Star Dragon #001</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Filter & Products Section -->
    <section class="pb-20 px-4">
        <div class="max-w-7xl mx-auto">
            <!-- Section Header -->
            <div class="flex flex-col md:flex-row md:items-end justify-between gap-4 mb-8">
                <div>
                    <span class="text-xs uppercase tracking-widest text-cyan-400 font-medium">Our Collection</span>
                    <h2 class="text-2xl md:text-3xl font-semibold mt-1">การ์ดยอดนิยม</h2>
                </div>
                
                <!-- Dynamic Filter -->
                <div class="flex flex-wrap gap-2" id="filter-container">
                    <button class="filter-btn active px-4 py-2 text-sm rounded-lg border border-white/10 hover:border-cyan-500/50 transition-all" data-filter="all">
                        ทั้งหมด
                    </button>
                    <button class="filter-btn px-4 py-2 text-sm rounded-lg border border-white/10 hover:border-cyan-500/50 transition-all text-slate-400" data-filter="pokemon">
                        Pokémon
                    </button>
                    <button class="filter-btn px-4 py-2 text-sm rounded-lg border border-white/10 hover:border-cyan-500/50 transition-all text-slate-400" data-filter="yugioh">
                        Yu-Gi-Oh!
                    </button>
                    <button class="filter-btn px-4 py-2 text-sm rounded-lg border border-white/10 hover:border-cyan-500/50 transition-all text-slate-400" data-filter="magic">
                        Magic: The Gathering
                    </button>
                    <button class="filter-btn px-4 py-2 text-sm rounded-lg border border-white/10 hover:border-cyan-500/50 transition-all text-slate-400" data-filter="onepiece">
                        One Piece
                    </button>
                </div>
            </div>

            <!-- Product Grid -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5" id="products-grid">
                <!-- Card 1 -->
                <div class="card-item glass-panel rounded-xl overflow-hidden group" data-category="pokemon">
                    <div class="relative aspect-[3/4] overflow-hidden">
                        <img src="https://picsum.photos/seed/pika/400/533" alt="Card" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700">
                        <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                        <span class="absolute top-3 left-3 px-2 py-1 bg-yellow-500/90 text-black text-xs font-semibold rounded">HOT</span>
                        <button class="absolute top-3 right-3 w-8 h-8 glass-panel rounded-full flex items-center justify-center hover:bg-cyan-500/20 transition-colors">
                            <i data-lucide="heart" class="w-4 h-4"></i>
                        </button>
                    </div>
                    <div class="p-4">
                        <div class="text-xs text-cyan-400 mb-1">Pokémon • 151 Set</div>
                        <h3 class="font-medium mb-2">Pikachu VMAX Rainbow</h3>
                        <div class="flex items-center justify-between">
                            <span class="text-lg font-semibold">฿2,500</span>
                            <button onclick="addToCart('Pikachu VMAX')" class="p-2 rounded-lg bg-cyan-500/10 hover:bg-cyan-500/20 transition-colors">
                                <i data-lucide="plus" class="w-4 h-4 text-cyan-400"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 2 -->
                <div class="card-item glass-panel rounded-xl overflow-hidden group" data-category="yugioh">
                    <div class="relative aspect-[3/4] overflow-hidden">
                        <img src="https://picsum.photos/seed/yugi/400/533" alt="Card" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700">
                        <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                        <span class="absolute top-3 left-3 px-2 py-1 bg-purple-500/90 text-white text-xs font-semibold rounded">RARE</span>
                        <button class="absolute top-3 right-3 w-8 h-8 glass-panel rounded-full flex items-center justify-center hover:bg-cyan-500/20 transition-colors">
                            <i data-lucide="heart" class="w-4 h-4"></i>
                        </button>
                    </div>
                    <div class="p-4">
                        <div class="text-xs text-cyan-400 mb-1">Yu-Gi-Oh! • PHRA</div>
                        <h3 class="font-medium mb-2">Destruction Swordman</h3>
                        <div class="flex items-center justify-between">
                            <span class="text-lg font-semibold">฿1,800</span>
                            <button onclick="addToCart('Destruction Swordman')" class="p-2 rounded-lg bg-cyan-500/10 hover:bg-cyan-500/20 transition-colors">
                                <i data-lucide="plus" class="w-4 h-4 text-cyan-400"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 3 -->
                <div class="card-item glass-panel rounded-xl overflow-hidden group" data-category="magic">
                    <div class="relative aspect-[3/4] overflow-hidden">
                        <img src="https://picsum.photos/seed/mtg/400/533" alt="Card" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700">
                        <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                        <button class="absolute top-3 right-3 w-8 h-8 glass-panel rounded-full flex items-center justify-center hover:bg-cyan-500/20 transition-colors">
                            <i data-lucide="heart" class="w-4 h-4"></i>
                        </button>
                    </div>
                    <div class="p-4">
                        <div class="text-xs text-cyan-400 mb-1">MTG • Dominaria</div>
                        <h3 class="font-medium mb-2">Black Lotus Foil</h3>
                        <div class="flex items-center justify-between">
                            <span class="text-lg font-semibold">฿15,000</span>
                            <button onclick="addToCart('Black Lotus Foil')" class="p-2 rounded-lg bg-cyan-500/10 hover:bg-cyan-500/20 transition-colors">
                                <i data-lucide="plus" class="w-4 h-4 text-cyan-400"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 4 -->
                <div class="card-item glass-panel rounded-xl overflow-hidden group" data-category="onepiece">
                    <div class="relative aspect-[3/4] overflow-hidden">
                        <img src="https://picsum.photos/seed/luffy/400/533" alt="Card" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700">
                        <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                        <span class="absolute top-3 left-3 px-2 py-1 bg-red-500/90 text-white text-xs font-semibold rounded">LIMITED</span>
                        <button class="absolute top-3 right-3 w-8 h-8 glass-panel rounded-full flex items-center justify-center hover:bg-cyan-500/20 transition-colors">
                            <i data-lucide="heart" class="w-4 h-4"></i>
                        </button>
                    </div>
                    <div class="p-4">
                        <div class="text-xs text-cyan-400 mb-1">One Piece • OP-01</div>
                        <h3 class="font-medium mb-2">Monkey D. Luffy SEC</h3>
                        <div class="flex items-center justify-between">
                            <span class="text-lg font-semibold">฿3,200</span>
                            <button onclick="addToCart('Monkey D. Luffy SEC')" class="p-2 rounded-lg bg-cyan-500/10 hover:bg-cyan-500/20 transition-colors">
                                <i data-lucide="plus" class="w-4 h-4 text-cyan-400"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 5 -->
                <div class="card-item glass-panel rounded-xl overflow-hidden group" data-category="pokemon">
                    <div class="relative aspect-[3/4] overflow-hidden">
                        <img src="https://picsum.photos/seed/charizard/400/533" alt="Card" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700">
                        <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                        <button class="absolute top-3 right-3 w-8 h-8 glass-panel rounded-full flex items-center justify-center hover:bg-cyan-500/20 transition-colors">
                            <i data-lucide="heart" class="w-4 h-4"></i>
                        </button>
                    </div>
                    <div class="p-4">
                        <div class="text-xs text-cyan-400 mb-1">Pokémon • Obsidian</div>
                        <h3 class="font-medium mb-2">Charizard V Alternate</h3>
                        <div class="flex items-center justify-between">
                            <span class="text-lg font-semibold">฿4,500</span>
                            <button onclick="addToCart('Charizard V Alternate')" class="p-2 rounded-lg bg-cyan-500/10 hover:bg-cyan-500/20 transition-colors">
                                <i data-lucide="plus" class="w-4 h-4 text-cyan-400"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 6 -->
                <div class="card-item glass-panel rounded-xl overflow-hidden group" data-category="yugioh">
                    <div class="relative aspect-[3/4] overflow-hidden">
                        <img src="https://picsum.photos/seed/darkmagician/400/533" alt="Card" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700">
                        <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                        <span class="absolute top-3 left-3 px-2 py-1 bg-cyan-500/90 text-white text-xs font-semibold rounded">NEW</span>
                        <button class="absolute top-3 right-3 w-8 h-8 glass-panel rounded-full flex items-center justify-center hover:bg-cyan-500/20 transition-colors">
                            <i data-lucide="heart" class="w-4 h-4"></i>
                        </button>
                    </div>
                    <div class="p-4">
                        <div class="text-xs text-cyan-400 mb-1">Yu-Gi-Oh! • MVP1</div>
                        <h3 class="font-medium mb-2">Dark Magician MOSAIC</h3>
                        <div class="flex items-center justify-between">
                            <span class="text-lg font-semibold">฿990</span>
                            <button onclick="addToCart('Dark Magician MOSAIC')" class="p-2 rounded-lg bg-cyan-500/10 hover:bg-cyan-500/20 transition-colors">
                                <i data-lucide="plus" class="w-4 h-4 text-cyan-400"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 7 -->
                <div class="card-item glass-panel rounded-xl overflow-hidden group" data-category="onepiece">
                    <div class="relative aspect-[3/4] overflow-hidden">
                        <img src="https://picsum.photos/seed/zoro/400/533" alt="Card" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700">
                        <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                        <button class="absolute top-3 right-3 w-8 h-8 glass-panel rounded-full flex items-center justify-center hover:bg-cyan-500/20 transition-colors">
                            <i data-lucide="heart" class="w-4 h-4"></i>
                        </button>
                    </div>
                    <div class="p-4">
                        <div class="text-xs text-cyan-400 mb-1">One Piece • EB-01</div>
                        <h3 class="font-medium mb-2">Roronoa Zoro SR</h3>
                        <div class="flex items-center justify-between">
                            <span class="text-lg font-semibold">฿1,500</span>
                            <button onclick="addToCart('Roronoa Zoro SR')" class="p-2 rounded-lg bg-cyan-500/10 hover:bg-cyan-500/20 transition-colors">
                                <i data-lucide="plus" class="w-4 h-4 text-cyan-400"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 8 -->
                <div class="card-item glass-panel rounded-xl overflow-hidden group" data-category="magic">
                    <div class="relative aspect-[3/4] overflow-hidden">
                        <img src="https://picsum.photos/seed/mana/400/533" alt="Card" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700">
                        <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                        <span class="absolute top-3 left-3 px-2 py-1 bg-green-500/90 text-white text-xs font-semibold rounded">INSTOCK</span>
                        <button class="absolute top-3 right-3 w-8 h-8 glass-panel rounded-full flex items-center justify-center hover:bg-cyan-500/20 transition-colors">
                            <i data-lucide="heart" class="w-4 h-4"></i>
                        </button>
                    </div>
                    <div class="p-4">
                        <div class="text-xs text-cyan-400 mb-1">MTG • Innistrad</div>
                        <h3 class="font-medium mb-2">Snapcaster Mage</h3>
                        <div class="flex items-center justify-between">
                            <span class="text-lg font-semibold">฿2,100</span>
                            <button onclick="addToCart('Snapcaster Mage')" class="p-2 rounded-lg bg-cyan-500/10 hover:bg-cyan-500/20 transition-colors">
                                <i data-lucide="plus" class="w-4 h-4 text-cyan-400"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="border-t border-white/5 py-12 px-4">
        <div class="max-w-7xl mx-auto">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-8 mb-8">
                <div class="col-span-2 md:col-span-1">
                    <div class="flex items-center gap-2 mb-4">
                        <div class="w-8 h-8 rounded-lg bg-gradient-to-br from-cyan-400 to-blue-600 flex items-center justify-center">
                            <i data-lucide="layers" class="w-5 h-5 text-white"></i>
                        </div>
                        <span class="text-lg font-semibold">NovaCards</span>
                    </div>
                    <p class="text-sm text-slate-400 mb-4">ร้านการ์ดเกมพรีเมียมที่เชื่อถือได้มากที่สุดในประเทศไทย</p>
                    <div class="flex gap-3">
                        <a href="#" class="w-8 h-8 rounded-lg border border-white/10 flex items-center justify-center hover:border-cyan-500/50 transition-colors">
                            <i data-lucide="facebook" class="w-4 h-4"></i>
                        </a>
                        <a href="#" class="w-8 h-8 rounded-lg border border-white/10 flex items-center justify-center hover:border-cyan-500/50 transition-colors">
                            <i data-lucide="instagram" class="w-4 h-4"></i>
                        </a>
                        <a href="#" class="w-8 h-8 rounded-lg border border-white/10 flex items-center justify-center hover:border-cyan-500/50 transition-colors">
                            <i data-lucide="youtube" class="w-4 h-4"></i>
                        </a>
                    </div>
                </div>
                <div>
                    <h4 class="font-medium mb-4">สินค้า</h4>
                    <ul class="space-y-2 text-sm text-slate-400">
                        <li><a href="#" class="hover:text-white transition-colors">การ์ดเดี่ยว</a></li>
                        <li><a href="#" class="hover:text-white transition-colors">กล่องการ์ด</a></li>
                        <li><a href="#" class="hover:text-white transition-colors">อุปกรณ์เสริม</a></li>
                        <li><a href="#" class="hover:text-white transition-colors">Limited Edition</a></li>
                    </ul>
                </div>
                <div>
                    <h4 class="font-medium mb-4">บริการ</h4>
                    <ul class="space-y-2 text-sm text-slate-400">
                        <li><a href="#" class="hover:text-white transition-colors">ตรวจสอบการ์ด (Grading)</a></li>
                        <li><a href="#" class="hover:text-white transition-colors">รับซื้อการ์ด</a></li>
                        <li><a href="#" class="hover:text-white transition-colors">จัดส่งพิเศษ</a></li>
                        <li><a href="#" class="hover:text-white transition-colors">รับประกันของแท้</a></li>
                    </ul>
                </div>
                <div>
                    <h4 class="font-medium mb-4">ติดต่อ</h4>
                    <ul class="space-y-2 text-sm text-slate-400">
                        <li class="flex items-center gap-2">
                            <i data-lucide="phone" class="w-4 h-4"></i>
                            081-234-5678
                        </li>
                        <li class="flex items-center gap-2">
                            <i data-lucide="mail" class="w-4 h-4"></i>
                            shop@novacards.th
                        </li>
                        <li class="flex items-center gap-2">
                            <i data-lucide="map-pin" class="w-4 h-4"></i>
                            กรุงเทพฯ
                        </li>
                    </ul>
                </div>
            </div>
            <div class="pt-8 border-t border-white/5 flex flex-col md:flex-row items-center justify-between gap-4 text-sm text-slate-500">
                <p>© 2025 NovaCards. All rights reserved.</p>
                <div class="flex gap-6">
                    <a href="#" class="hover:text-white transition-colors">นโยบายความเป็นส่วนตัว</a>
                    <a href="#" class="hover:text-white transition-colors">เงื่อนไขการใช้งาน</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Interactive Cart Sidebar -->
    <div id="cart-overlay" class="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 opacity-0 pointer-events-none transition-opacity duration-300" onclick="toggleCart()"></div>
    <div id="cart-panel" class="cart-panel fixed top-0 right-0 h-full w-full max-w-md glass-panel z-50 transform translate-x-full">
        <div class="flex flex-col h-full">
            <div class="p-6 border-b border-white/10 flex items-center justify-between">
                <h2 class="text-xl font-semibold flex items-center gap-2">
                    <i data-lucide="shopping-bag" class="w-5 h-5 text-cyan-400"></i>
                    ตะกร้าของคุณ
                </h2>
                <button onclick="toggleCart()" class="p-2 rounded-lg hover:bg-white/5 transition-colors">
                    <i data-lucide="x" class="w-5 h-5"></i>
                </button>
            </div>
            
            <div class="flex-1 overflow-y-auto p-6" id="cart-items">
                <!-- Cart Items will be rendered here -->
            </div>

            <div class="p-6 border-t border-white/10">
                <div class="flex justify-between items-center mb-4">
                    <span class="text-slate-400">รวมทั้งหมด</span>
                    <span class="text-2xl font-bold text-cyan-400" id="cart-total">฿0</span>
                </div>
                <button class="w-full py-3 bg-gradient-to-r from-cyan-500 to-blue-600 rounded-lg font-medium hover:opacity-90 transition-opacity">
                    ดำเนินการชำระเงิน
                </button>
                <p class="text-center text-xs text-slate-500 mt-3">จัดส่งฟรีเมื่อสั่งซื้อครบ ฿1,000</p>
            </div>
        </div>
    </div>

    <script>
        // Initialize Lucide Icons
        lucide.createIcons();

        // Cart Data
        let cart = [
            { name: 'Pikachu VMAX Rainbow', price: 2500, qty: 1 },
            { name: 'Dark Magician MOSAIC', price: 990, qty: 1 }
        ];

        // Toggle Cart
        function toggleCart() {
            const overlay = document.getElementById('cart-overlay');
            const panel = document.getElementById('cart-panel');
            
            if (panel.classList.contains('translate-x-full')) {
                overlay.classList.remove('opacity-0', 'pointer-events-none');
                panel.classList.remove('translate-x-full');
            } else {
                overlay.classList.add('opacity-0', 'pointer-events-none');
                panel.classList.add('translate-x-full');
            }
        }

        // Render Cart
        function renderCart() {
            const cartItems = document.getElementById('cart-items');
            const cartCount = document.getElementById('cart-count');
            const cartTotal = document.getElementById('cart-total');

            if (cart.length === 0) {
                cartItems.innerHTML = `
                    <div class="flex flex-col items-center justify-center h-full text-center">
                        <i data-lucide="package" class="w-16 h-16 text-slate-600 mb-4"></i>
                        <p class="text-slate-400">ตะกร้าว่างเปล่า</p>
                        <p class="text-sm text-slate-500 mt-1">เริ่มเลือกซื้อการ์ดกันเลย!</p>
                    </div>
                `;
                lucide.createIcons();
            } else {
                cartItems.innerHTML = cart.map((item, index) => `
                    <div class="flex gap-4 mb-4 pb-4 border-b border-white/5">
                        <div class="w-16 h-20 rounded-lg overflow-hidden bg-slate-800 flex-shrink-0">
                            <img src="https://picsum.photos/seed/${item.name}/100/125" alt="${item.name}" class="w-full h-full object-cover">
                        </div>
                        <div class="flex-1">
                            <h4 class="font-medium text-sm">${item.name}</h4>
                            <p class="text-cyan-400 text-sm mt-1">฿${item.price.toLocaleString()}</p>
                            <div class="flex items-center gap-2 mt-2">
                                <button onclick="updateQty(${index}, -1)" class="w-6 h-6 rounded border border-white/10 flex items-center justify-center hover:bg-white/5 transition-colors">
                                    <i data-lucide="minus" class="w-3 h-3"></i>
                                </button>
                                <span class="text-sm w-8 text-center">${item.qty}</span>
                                <button onclick="updateQty(${index}, 1)" class="w-6 h-6 rounded border border-white/10 flex items-center justify-center hover:bg-white/5 transition-colors">
                                    <i data-lucide="plus" class="w-3 h-3"></i>
                                </button>
                            </div>
                        </div>
                        <button onclick="removeFromCart(${index})" class="text-slate-500 hover:text-red-400 transition-colors">
                            <i data-lucide="trash-2" class="w-4 h-4"></i>
                        </button>
                    </div>
                `).join('');
                lucide.createIcons();
            }

            // Update count and total
            const totalItems = cart.reduce((sum, item) => sum + item.qty, 0);
            const totalPrice = cart.reduce((sum, item) => sum + (item.price * item.qty), 0);
            
            cartCount.textContent = totalItems;
            cartTotal.textContent = `฿${totalPrice.toLocaleString()}`;
        }

        // Add to Cart
        function addToCart(name) {
            const existingItem = cart.find(item => item.name === name);
            if (existingItem) {
                existingItem.qty++;
            } else {
                // Simulate price - in real app, get from data
                const prices = {
                    'Pikachu VMAX': 2500,
                    'Destruction Swordman': 1800,
                    'Black Lotus Foil': 15000,
                    'Monkey D. Luffy SEC': 3200,
                    'Charizard V Alternate': 4500,
                    'Dark Magician MOSAIC': 990,
                    'Roronoa Zoro SR': 1500,
                    'Snapcaster Mage': 2100
                };
                cart.push({ name, price: prices[name] || 1000, qty: 1 });
            }
            renderCart();
            
            // Show notification
            const btn = event.currentTarget;
            btn.innerHTML = '<i data-lucide="check" class="w-4 h-4 text-cyan-400"></i>';
            lucide.createIcons();
            setTimeout(() => {
                btn.innerHTML = '<i data-lucide="plus" class="w-4 h-4 text-cyan-400"></i>';
                lucide.createIcons();
            }, 1000);
        }

        // Update Quantity
        function updateQty(index, change) {
            cart[index].qty += change;
            if (cart[index].qty <= 0) {
                cart.splice(index, 1);
            }
            renderCart();
        }

        // Remove from Cart
        function removeFromCart(index) {
            cart.splice(index, 1);
            renderCart();
        }

        // Dynamic Filter
        const filterBtns = document.querySelectorAll('.filter-btn');
        const productCards = document.querySelectorAll('.card-item');

        filterBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                const filter = btn.dataset.filter;

                // Update active state
                filterBtns.forEach(b => {
                    b.classList.remove('active');
                    b.classList.add('text-slate-400');
                });
                btn.classList.add('active');
                btn.classList.remove('text-slate-400');

                // Filter products
                productCards.forEach(card => {
                    const category = card.dataset.category;
                    if (filter === 'all' || category === filter) {
                        card.style.display = 'block';
                        card.style.animation = 'fadeIn 0.5s ease-out';
                    } else {
                        card.style.display = 'none';
                    }
                });
            });
        });

        // Initialize
        renderCart();

        // Add fadeIn animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(10px); }
                to { opacity: 1; transform: translateY(0); }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>
