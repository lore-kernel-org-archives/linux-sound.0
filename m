Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9310D31C567
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 13:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235419; cv=none; b=u/l1rQL0KMRK3r7BiYRHaF3oNnE8d3tEQdwnZRqes3D9P1DMnb6jGA0sb66r+4Ab+U+xYBLlNnb05OTy/xlywR763Qv74y/zKy/znNWQeTZpb+gYh0yZhk4fKh4FIdhXetTarxRVyH554R25q5fKbiL2ApJqRnWZNrbhthcRps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235419; c=relaxed/simple;
	bh=bQRlE5OR+3/41N9B/xBGXfMeOTv3hgeQ2WrY6jcTpBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXbFeKpdr53KfAJc7BPf6htCsGEJ1poGCcHRwW1SqLxcLeu4chOTsMA32FJbPyU25ehcKhB7crKwwL7lg5nwdSmTkTJQ1DQkGFZ8XeUse/DqYAWn7rKctSW7XnMNhbCCSSkLhVy4zT6rultg/Ot5d19IaE9lBPGMCz/CtI3olnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56b18f05f49so2424168e0c.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 06:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235415; x=1773840215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34DR94e/1PAvLLEaib58vFA4GW0m5SGe6jvxchEhMek=;
        b=io0Qc4sHzFsIjl+70/ZYXjBmVprtSPd8hWd7xN8TGkDARhLwjDBzry/jBF9Py1Knrg
         etJLltdDzd/Eee4mhnpXDpKi8JLHfwhw5/8cw8jp/+9e+OwVMKkYmrMzIOd1ThOi8Nr/
         tdYowRizpYvNZ66wJodtfolAyDPEcq6IdXA2uFgxjEt27cfHVhycJNLyxz+45cIAUVZn
         R/1kZz4bC4ce2WLmBZsfeAkd9foWKr0/eO+9Rb2hMW1nvkr92S9ntB4+WlHJRSQNXQUb
         cL+BI059PQoQeo6mkPB1IWVf+Uibs1gFlWVmJG+nbZFeQNlfVGTTM9igyoEM1xWVGslM
         JPoA==
X-Forwarded-Encrypted: i=1; AJvYcCWjS4WVYhcq7MgLdTnCOViUz9imaTgepHTbNeN3uimGx2kMxXLEXK+qwvf9sE/4IA8py2a4e4B2aX4Bvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL9Ih9q1MSv/BMt12vTECQfFC6Merfs9t94bhxzPNOhsSd5vM2
	9l0AI852cQXA2Q5zNy0nIxtBG+6q3RHwXItJGhlfbqvZ3cvj+2MI43za39J4zNkBxR4=
X-Gm-Gg: ATEYQzwyXCHLIhGnkAxDDX33ZVYZwNsxDgKdK9qRnYRTG2Pp31IIgdSb7rr2+7hJI6Y
	VfT9ZXXBkyl6lV1iM7LPdLE+0NtlnkeA0jdMhUd0GIX+NtwGI9bL8PAplAJMqySAVOcRbBVcwY4
	MXsVgQvzo1C/P0cyTMoo1C33DClbMWnhYQckJHlrMCK+vEELF0VQT+1dTFFDrPZIlpl43qksVI5
	KGqB7OGJrX0/uv6t/QcZieRcldwi4dxXu+L0epaQ9vxwvHIC/D6ZNtP7RdRGxCv2RJqbNGfwAYl
	sZRYSoljsngN949vde06uTbl5kMDV8KHxVoCPJPxUfvfM6hR8KtRJby98dzRddW0A8Iq+un4lR4
	m0hsescgZN513LAIqJBfFMWmTzO1JPSHefoX0M5gbcDZ59jbHOwCqh6e/iK2QFGGONiz6GOB36v
	JTxOp9MywhYpQXjW04FiyShhlkdpPTWynFHQ/8nUiP6BenIWDzL6DNXTmEM7OF
X-Received: by 2002:a05:6122:82a7:b0:56b:3736:a6e6 with SMTP id 71dfb90a1353d-56b4754e90emr871568e0c.14.1773235415415;
        Wed, 11 Mar 2026 06:23:35 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b463510a5sm922217e0c.8.2026.03.11.06.23.35
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:23:35 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5fff18d44fbso3422406137.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 06:23:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNBz3aDUaRpd6uMCKn1mWR4heBkFBAjmu+Lustnj3UoOHd8omGVkD5WhgFJnzY1dKsanXGUrc9tzM6Vg==@vger.kernel.org
X-Received: by 2002:a05:6122:1d05:b0:55b:7494:177b with SMTP id
 71dfb90a1353d-56b4752d806mr922396e0c.10.1773234967338; Wed, 11 Mar 2026
 06:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de> <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 14:15:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
X-Gm-Features: AaiRm52J84H77ROK64ZWWtJfaiCpnFeKyoSRmPbi-NC8CN6Ju1TJEFxJU9gZQQ8
Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
Subject: Re: [PATCH 36/61] arch/sh: Prefer IS_ERR_OR_NULL over manual NULL check
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	samba-technical@lists.samba.org, sched-ext@lists.linux.dev, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	v9fs@lists.linux.dev, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Mar 2026 at 12:56, Philipp Hahn <phahn-oss@avm.de> wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
>
> Change generated with coccinelle.
>
> To: Yoshinori Sato <ysato@users.sourceforge.jp>
> To: Rich Felker <dalias@libc.org>
> To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
