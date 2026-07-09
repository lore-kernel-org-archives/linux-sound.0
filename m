Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB373C13EE
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 19:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625982; cv=pass; b=BhAI57dADHAM5htfVLD8cDFkVkEyb0+kJCqbnH4V2i7hm2H9OxdNGMNk7XM5Ru593s3R5etHGe5gT+71jpYN0UyxxQJnkyhKjYJqaGbi3d59kaPCVpeUVwbMsFhn6Rj8M6CROonJS2ctWNzJmUtPvVD0DmrYjoQ/FIoUyVMzd1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625982; c=relaxed/simple;
	bh=aAXv2bwScwMDOYXSIZVHjyBXAJd7Bwdov7VBQCdTNHM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=JV3hLByQAsNevHiV9WR5eRbCcWL9TriQz7iwe04FZyoO8prpB/llZ+oefrwl15Qh/OMND3sBs7yLf+vvjBfXH6wfxQ93gHxlcA0cVapXWUnZdvrsHVGOzNAQjnD3Ok2SY5RoUqOkJ2JU979rUi2LTzKXaSQTtHAKAI0Qg/JuouE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEa5z3h4; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEa5z3h4"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6676fc59e59so221167d50.2
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 12:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783625980; cv=none;
        d=google.com; s=arc-20260327;
        b=PoX3+n+GarzONms07OEaiuhaiyacoXzvi/ck79f1mhK1RKutxx4sV0TfbK+VZZy+ES
         rw3RzOsGn5+0kdi7+BwPwrBR6wTCf/mcq5Qh63S9VwCIFnvByn1UMLjcfrsW7HgAZJTY
         JcNHghCqybRDZrWMKT7NxjPoCAMzOF3LZS4Y0mcI1k2l9jp4b2M3fi85WNAFocfCK6aC
         2wIBIB5G86xncr2Zwp+dxKgwADHO77wSOS/V1V0ECrdB2FqbNJ8U0ZBgszMUO1dFp5yC
         PbxjOvuwc01egOFejKm4ImZUqAAFpuJU+L4t8mIMimJe3ob6ZVG4YssGu+2CadOE2Y1q
         ZM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=aAXv2bwScwMDOYXSIZVHjyBXAJd7Bwdov7VBQCdTNHM=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=aoV0ihQglMKWC3ND+BSEFzEdQNzvluOS5CFSISdf65xBHKmi9b4EWasoc2byOH6LSy
         3ShE/CCF76bB+CVCeCw5AN+kfc8pWtjlK1DKobgTuXr5JkBoyp5bKn2Ut6CshJ0HCP+I
         25qzsrDdo6si98WLitDnON5FzXZyWos0Kq2gVbj6h7iMtcUtjbKDl+y48+rHan9Yhm2+
         udSA3nZQmUCOS91Q1m+D7nShlZIiDWVVPVpy/a95+h5Gme3SZ1Kx8qUZjN+htAWKnBxB
         mfDbu1DIa3BZ/gfjvkdoJvizMtJGH6ryVHpEVy6QQ7JydoWvGWaSZVj3aHYlA+N1jk7p
         MUJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625980; x=1784230780; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aAXv2bwScwMDOYXSIZVHjyBXAJd7Bwdov7VBQCdTNHM=;
        b=BEa5z3h4n+LAyiI+XD6D9dBvbV6g3/iFi4R5qq0uKvjxihYBEYTCC2VrLYv5bBVvYv
         vZxWY5cgb3gKuuxXQ7Y70Dy93+MNFJVnF+MK1OeqbVFwS6B0oQs8ntuwMvXZD+bD2ZQ0
         ypWlFKu8W45B+LZw5rJc03mpnahKCoFfx+vA5xQverVk5zTFh8/uFmk10v09jJwN6BoD
         UWlDoqn94URf/oWRCZEG81Acr8fEKOxCqPhaVdSnQAy0zl1plIVfTpHnRDVAIZybtFsS
         DBlSMmVzyVZr61wy1qRmlugwP07RWzQ7HN97IC72xYoK/BVGGU1s0L6bTAWUaIAqOiX2
         mdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625980; x=1784230780;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAXv2bwScwMDOYXSIZVHjyBXAJd7Bwdov7VBQCdTNHM=;
        b=B4DRiQu8dlJdhRgVNflze3hogXkgz0xTXZsKchPY9zPdRoGvXWThL7AYnq+lEs6b5w
         wvyBTBGIZMhD/jJEQuxVshJyPgNS04luxUwe2QQI106ibbfXWa8A4SCwFz9eRz1jxggb
         NmNkNjs1WjoVPBrqetSkTvPl7/LF8J8Lrj66m3I4fh+xtU3JU7ip6u68Ejk4M5ZKQ/Gp
         z/MArsr1Is5t6A6BCTfboIMnCCkqfjMUtCY52W+HXBBVevrENei7vSkXGdfhLiJP0I3w
         8apY5lMfKJI4dXvn8X/QFTld4uVjkHZV69kEdAtfuOlwdRq3VzD8bZ4Qb9/gMrnARqZJ
         A3pw==
X-Gm-Message-State: AOJu0YwT4NRyAMeQKUnl7EKSVMpgXHLHMiUGid5Q+ful3pWvJEC6ifW1
	hhWgmzCuuuYlue5NWPegcbkJGlzdL/BnXfL5PD+EXps8iiHNt1Z+TyHNK7157eq5AAyoDEWcexX
	N4NvasMO6OxhdSylz5kWuw8uvZobza+qzbxLIJow=
X-Gm-Gg: AfdE7cmMozHlaBHRw8JyWRoLTirjAPfY7KwbVlpeW67X+l57QW6TIexE6l1UCw2s8zb
	2frqFS0VhflU9/ON9Dp2+R/IspSSVj7Sau9Abv6eLWZVPxsa/OPF7OWPFQjlCoI1G2ptDotV/8c
	x2OcH1Bbhw12v1xz7BgVr7a3V4F6vpQcIFSmff3agXSpJAXjgKMgdU0duG60qyFxe0LTMZZ9dCd
	tv8pv5gijpHlJN8a02SbOGcBa62QrYOQCFU79beNWYwjCsQtczIRPGvBamfyYTPtYMQ/2eUnWP0
	UX6n06g=
X-Received: by 2002:a05:690e:1699:b0:667:9010:2afd with SMTP id
 956f58d0204a3-6679f09996dmr6253628d50.38.1783625980411; Thu, 09 Jul 2026
 12:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Purgenta <ytbusinesspurgenta@gmail.com>
Date: Thu, 9 Jul 2026 15:39:30 -0400
X-Gm-Features: AVVi8CdLf2vP1hOSTNR8LpYJ2COhw4lTrWxRH_BR8GOidJZO4avRe5TduXC23Zw
Message-ID: <CAMWq6C_2_0f-NzN0zN3eEF0XM68zmx8BL02-u_9Mw9DuvS0i-g@mail.gmail.com>
Subject: Missing Amplification on Bang & Olufsen Speakers (HP ZBook 15 G6)
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

On the Linux kernel, the Bang & Olufsen speakers present on the HP
ZBook 15 G6 sound flat due to the lack of necessary amplification.
This may be due to the missing "HP Clear Sound Amp" module on it. This
lack of amplification does not occur on the Windows kernel. I have
tested this from the 6.x kernels all the way to the latest 7.x, and
the issue remains the same. If it helps, here is a link to the ALSA
report for this:
https://github.com/user-attachments/files/29149672/alsa-report.txt

Additionally, I've provided some hardware details below:

Laptop Model: HP ZBook 15 G6
CPU: Intel Xeon E-2286M
GPU: NVIDIA Quadro T2000
Audio Codec: Realtek ALC285
Speaker Brand: Bang & Olufsen (B&O)
Speaker Type: Dual Stereo

I hope this can be patched soon!

From,
Purgenta
