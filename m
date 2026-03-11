Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BEE22A4F1
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 14:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238433; cv=none; b=d1cAKE+2ZOLcF6Q934nsbyHfUhrClylmh7x5Y/McNq09ffNbrSt3FvIqFp0pmiwvJZ/d6NOc8EcaDXeLUnCdqXzRi9ukrmNhBvANLYoZMdT2X62vingjeBw87Z0UmcaQNcsSi29oe4MKViUOSiXYuKBrsZqmTxvw3PQZiBx+B6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238433; c=relaxed/simple;
	bh=POUJjzeRhBIXfPGojdZfC417KH92loTKx1KmDpRcfoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKpYm7ChSvk9bIGjN+zkufsnr7iuPRi4PtEUIe7gz1xqKqtCn9aqTDuNlW56u3Uucqw/ApwzLUbJrliy9/yHFPXcOSxD4LVSb2hKgLnOQai2RYtZwDykpze+GCoXiHxk5ziKT/HG4F5sVbWB67lkgMiTpM80xVnY+VHFPDb6XnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b942b36de08so190783466b.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 07:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238430; x=1773843230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIz9Fr5w5J45ZN4rxwvT/0kjXMGfLP1VpB2aKPOax7k=;
        b=QoHykAAwcNiKKppf1GMs7QKHCImMT5zpXpupMn6Ng2bzYnWJEWFjVoAr5l+HbWvnU3
         BbKzssgmn6HM1NT+0FzzfszAAgLA9eW9DCiHAi0TnqaYsaCErhFkSTeuAHceLtq4eTyb
         VNasfmYBI1i7QL7fYJ8VOqM2xEuboER982OrqBFKCz7P0MQlK6DtkS+iOjagOxYR28ht
         iozd4AJAP+Rro3sO3mJBtB3X/9fS6vi1ur/8hWuHayJipHKPjSa5EsgaQakQT0PPIwYO
         Opcv6IgzOD+ovRWJXVmuInFdrF4Ztr310ypL4MHqvk125PYTex8Cqn44kcYvzePV9ws+
         3KUw==
X-Forwarded-Encrypted: i=1; AJvYcCXOqIZgcySKZro8HOC4vNsSQbZimkWeP5+A7TKOI88vchCtGAX1kbm5Gyeog8rRP2MhuCfq4lSEPNvTDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfmRxzkVJpd2MotNwDQO1WDwABQNrjxjIS2zD9vcxwJBkH6LbK
	OArLtJLavlkMXK9umh2Jht4MuNPdTRw7N4WjvlkDdnG75LNv7xQmLhxWz6GzF47FAvO+rQ==
X-Gm-Gg: ATEYQzw4AIRyvlVRm77WUCioUFsAFoeRvzI1tJtOzF3c3BSnhBMufugH/PGwXGuxmpY
	G5RMPcng9Usz21BpELnLXE/Pl6mRtHgmcZajTX6xux27sZz91QVpFGoyRAHGIH/1MBgOe5kqyG2
	PRUwxYhJhwtbtn8BcBJuShDXYav8SBVhpZ/B2wi5rFuorZMno0Ei88ReAR/0OJM5Rf9A/lmJFmh
	s15p2kMTz9wPC6k6vJRD0yKgMWhqf7NkupmOdZtrlTmezNDxY5luBHaNFJRW8TI6dLkm5xcj9al
	aKMavj+oUuF3i/bG/d2xKw62eN5meg/CLHYTIvwcmaVBcSywLY4VaeOf/2WBxVStwTOdTgnxqmV
	Ax0+rv5ByU5WsWF3X8J/4hOjRg88PiUuAYSZ6DKwTLm6f1Y60DB7ubQQcEj4pKLjK5X5jCdEqIf
	w28fugihEnUfgiRD9llckpiB4CxchZicWZcmzkZseLZ77C3pt9fPZlx1GzzRxP
X-Received: by 2002:a17:907:7b95:b0:b93:cbc9:85d6 with SMTP id a640c23a62f3a-b972d526189mr162286766b.11.1773238430124;
        Wed, 11 Mar 2026 07:13:50 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e185269sm56247466b.50.2026.03.11.07.13.49
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 07:13:49 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-660be63279bso1545657a12.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 07:13:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrszn3E/JyCHJGbk9ua41qnXDRdi9BiWgjGPDmFs1Xb3WsM7Z1sRXfIx5tmPFjKfQNIk3gSQORXJ0ttg==@vger.kernel.org
X-Received: by 2002:a17:907:6d16:b0:b88:4f25:81da with SMTP id
 a640c23a62f3a-b97113ff0b9mr462021166b.0.1773237981235; Wed, 11 Mar 2026
 07:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-15-bd63b656022d@avm.de> <20260310100750.303af303@gandalf.local.home>
 <20260311141332.b611237d36b61b2409e66cb3@kernel.org> <20260311100332.6a2ce4b1@gandalf.local.home>
In-Reply-To: <20260311100332.6a2ce4b1@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 15:06:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
X-Gm-Features: AaiRm53WEGMMLW4z34e7P-lM1qFvsCJGZ_o4JNL5NPWbhJPKmcqz6k9bJcyL--8
Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
Subject: Re: [PATCH 15/61] trace: Prefer IS_ERR_OR_NULL over manual NULL check
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Philipp Hahn <phahn-oss@avm.de>, amd-gfx@lists.freedesktop.org, 
	apparmor@lists.ubuntu.com, bpf@vger.kernel.org, ceph-devel@vger.kernel.org, 
	cocci@inria.fr, dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
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
	v9fs@lists.linux.dev, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"

Hi Steven,

On Wed, 11 Mar 2026 at 15:03, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Wed, 11 Mar 2026 14:13:32 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
>
> > Hmm, now IS_ERR_OR_NULL() is an inline function, so it is safe.
> > But if you want to use IS_ERR_OR_NULL() here, it will be better something like
> >
> > node = rhashtable_walk_next(&iter);
> > while (!IS_ERR_OR_NULL(node)) {
> >       fprobe_remove_node_in_module(mod, node, &alist);
> >       node = rhashtable_walk_next(&iter);
> > }
>
> But now you need to have a duplicate code in order to acquire "node"
>
> I think the patch just makes the code worse.

Obviously we need a new for_each_*() helper hiding all the gory internals?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
