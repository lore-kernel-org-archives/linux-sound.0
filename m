Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C87839F193
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 21:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326474; cv=none; b=qKu15wY9LZF6kT56XFqcmF6VAPl7msQ7HDgvfoFA3EtzmIBfOqmnIWkgos0sJFRNNsKGp+FXFhJx4106gcMjRueL1yfRx3Nvd/gl00fxR3MEZx7QyEnLMBHZ3eywQKrIUfymPw7lzVlclh/EFKzJn8rb4DTlyi+SzlWqN9PrZeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326474; c=relaxed/simple;
	bh=i/k46YQbNxc6jmDhpSrBTZQploRe2hY24KQV/uGHVj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qh7F7NlDYzZRnYJyqW+R0vq3BzyUkBXy/wLovXhYcX6v2jJrL/giy/AJVlG5t1CfVMr9Ep5Ri6dFFPwSGe686LfmJ8jlBpR68LmmW6Lkc+KANqmmj3t+CZq0fCL7hV1EEjt89+hditqMS2BxG9QiFqj4JnTr3yCsxdzwPSISzrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ou4EefLs; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ou4EefLs"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-678a526f374so6521844a12.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 14:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777326471; x=1777931271; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=Ou4EefLsD89+33u7lN8YF830ZEKNNcMDFIwni2ongv+V3r+EL8hIZl5fxM8eITUZA3
         SbpFXjhhgs+OXAyy8bwBXI2VGdE+MH745MMC+SLIC2FkfgIQe3ZVpTcJ5QD9ChmpuGfW
         ndRBkaLn8Sqc/LLOI3Mmt76HsloXjO3Rzo9dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326471; x=1777931271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=rBTxwx2yFtUiF1fDRAMXygal/eLO8chErtj5nrpMA/pFtSHjjhnAzkK5nLn3BMEn4v
         0hsybhE5n1to2EBa0eldN/8zdJgik+c6910Irjo38KJwyjPMLAks3TOigmcCfqFbNiV+
         loHhkzsbMIMqlftiaRfa1/dm/SitXtOHaWv5wtDkgwJBZepLU9TFUY226hJovQAizh8O
         Vvj+sNzIO08U9R1RqaNDANgJvjd7SKYvKuzNawmPk1jN/ImbiZErnbeeOMwp8JN9Ku98
         8eFhKfPiT7cr6yXL78iLIVhcwAvYEo2z0jpz3e8bCPVhgyjszjH6u5rTyqDu+j/25qgi
         qT6g==
X-Forwarded-Encrypted: i=1; AFNElJ/nwkr7G/Jj/j+x/iEHrM60O+vueetiqMQIyjcZnCWW7Li/KUWhQ3cdK5zXF/cSjcS9jHm/zkiYyejbeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBZN1NXa5Ajq1/arbQCwTKxBXzXIcyn3gMiL/Ilb+LufWCYLZy
	Sg3i1vFt8B/LOyYMnS9dgDZbGrKRWIapwwFRugqp0aqmiYRBmZB/oYx3yeVG1R9h+JHZJ4dGm++
	6h6ho3W/yig==
X-Gm-Gg: AeBDiet/HZA046/Xp9zm0WCtMe+0PfR+Zj2uISnqeOQmCzrqlZpEe8e1Vhb2WDg0v0R
	Ybu+sGgXc/oG+i6qIUG14yGSp6zf3g1g0971Xwb7TUVyCL28C7VZKMUhsKEC90rL5BZInHPJN1s
	TpDiWqshvCDEAlCM7M49t1NCKQA2/6OFvM3gued4n6GSC3+/nBy7O4tZYzPTEfOxCK9Mu1YoHQd
	7TrNFiH0L33omidvyMPW41zoTSufvuD0J5xWbpdNEEmU8FQNA7vDJCzzauv/RAPz1jSKibwLSRU
	4CUyISFtsEZFCtqr3W/m99Hz7WC9U4edDtWH1OkjV14f75lVcVemJc5lROKwVHVTJtiMVvYUbtW
	0TLY2pKbuQq5nb7c0l+8u3v5K/ZBvyaPXgrBnrQ47j5mxLW91qH+dPSeN7fqcxnYsVKX04bdJYw
	nOnc0IwnCNG24pqeZkMimL2nYTCJipauKKq9jlam9b9ZUPal0ThuDMpu3yPxOMCXPShrHBvXp7b
	6ypGC5lEHo=
X-Received: by 2002:a17:906:f588:b0:bab:cab:c372 with SMTP id a640c23a62f3a-bb802da8f8emr32380066b.22.1777326470481;
        Mon, 27 Apr 2026 14:47:50 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80c181787sm9092066b.59.2026.04.27.14.47.50
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:47:50 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8f97c626aaso849666166b.2
        for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 14:47:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9VKrWU25TFeQjIgYWWXDDO9jd2Sk3BbckmdrP1H4I1gMPhvT2dxWvEq3BV0l72q2UK/1ULCJD4htirSw==@vger.kernel.org
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com> <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus
