Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794984125;
	b=oNdTAjqJN9nImub2FQuoC4rctfxW8QZhUWrYXw+J7bSHBTEheFG7qgb9Dkdn2wMMMPW9
	 qaRlb8ArWKbmxuDqx42vgJs7DO/PPNAg2lwUzAiBw5dA/MVNLjDrYWnHWS7KjYXk3gipe
	 t06qzr0ihsuBfteMP6mRCKaSQfDre12QKYFyJQAXLyWisbTmmcYczqC83VfJ4uwMwZNw8
	 CIWR+wazg24GZh0pJfksiyulWZ50nM+L0OksKB3DmMtfc78w5SOTA6JSHood3WKQxlafA
	 +JQ+KgxvgvUtICAzu1wpAdrsGlExhnTcY0QLIUP6TS2FmRo4X73pcrg66g3yah1/HSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=TZHpNWUyJhxF/QroBLPDRCLY3hzBMbKzUTW2A7bIc0k=;
	b=kYNDcCxuIFlTVXP/TAw1WWsOVZgzzHwbtkU0K6o3iHypcT+fOUYk4F3QHxQZIwg/g0Ks
	 9xMGuPg9UessOuyROH6GTEMONl6AmZrr1adWb4+RRxfo7fZ69NWJIG0Yi5e4z6CRSZj0p
	 AQtuHCzROkKeJrQ+NU/CmEpD+pFQXEYp2ev8rEL2UHxqGSz5HHVEa4sYU1a5iXwEgmf7U
	 wkYk7/aD0f/CWmGbcCJJOaP1rSCZWlKflnjvNlOnDGR90d0x8xVHBVWubvKGb9SDkd2SA
	 EDbfB7ssgGLL2echPlu4JL1zLdqyxgf8tHD7e2tyXVrh7MkHCUMvK4YTrPES1qxWx0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iI3z10Hy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41640606A880
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 06:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41640606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iI3z10Hy
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso134156a12.3
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 22:42:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794984123; cv=none;
        d=google.com; s=arc-20260327;
        b=ox2nAzsabS/WuXtbt7+Xxagvfj+XKMIg6Rm8mIypVE8sp6Cia9xkmXMw8QVXcFzXnO
         JKqi41UgxVp0XmtuTguiC3t565Uukh0Sd5vzyZQo8mIHwA0kvsh5CnklMXpKcruDZcIH
         6d94SRGN4kyKAoAMjZV0iN8rQ9XN8BWrq/1eTetx3XGC9ZcwQx+3KaMR2+9MB0tfSdWG
         nQ+wjGyKsduGAdfiqhFvdSy3VUc/B3Vrv+TVATUmbC2DCfXjEZwXgY8vRdY2rL0dtaRM
         RU8tBzTFEJKUUIcmsA2Huc2QXr2ohQS/5YrAZIfLqbvf9Y3XSzSBhNJJXP51VXkUL7ll
         +iMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TZHpNWUyJhxF/QroBLPDRCLY3hzBMbKzUTW2A7bIc0k=;
        fh=lQ9i4v3UmckJF4WQLVx6DaY81f06EqoYbGZQzjjXp4c=;
        b=WSI5GozJrCcyl0GDSNYkS7+ekdOGXHrRDDoLzxEv868bjB4ZgUFG0aSjG6JeHjLOAU
         /zOvVduoieWK0iOEqqoc04J5GPIwcw1RFZDecMWZ4MIaFKEwhbi5jmW2NLVtRI6Jzfaf
         VhXnYvs74ciq17N9x7qfchxN18hJZOjNjSI1lvfigNYHFTIXvAIcKRhlLYLUwBTkQnT+
         iPH+fZU3zGLXkCEVREgG0qIW6fv+NxFJbeiHyP4OkEnTch7wUTgX+iKYrYUhAH2EZuO4
         ofTS3gYoqOF4luSmSwG41wYYklY8ULqdLnDPtYVJD7CYJglYxCkrnqlEaYXnKCqzxlOu
         XSJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794984123; x=1795588923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TZHpNWUyJhxF/QroBLPDRCLY3hzBMbKzUTW2A7bIc0k=;
        b=iI3z10HykV5ztd9mBwkTnjUkBP4rptgEqUpPkhf+Lfg0wn4Yp8gizv6Peb3p00h4Va
         aRyVeE3IHBp59k734Noh00dEXPh3cKmC0a78SKykMKpynReuYm0tl1V2E2Eir51Utpi1
         HntLjoCHSG3tQZW+xZsbsq/1xPLhFBLzu4XjWSLjFDgTLwP9ob5m8ppm51O3YI/veSmj
         0zfwTCv3of/nigRe8cE4286p2yb4Nb7IPxj74HMFjz/vyed+eTwsc49RyUo2Sm+ot9F1
         fxdj0nqbZBPc/di1pnw2fZNw1HN/Aq12meHqGoxLXiP72gMC0EeOe4p2bsForOHr8jUD
         2HTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984123; x=1795588923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZHpNWUyJhxF/QroBLPDRCLY3hzBMbKzUTW2A7bIc0k=;
        b=kjsUyjZ30TF8TG9iye1JMmMGzSJlQvwTE9zYEis+PHvV6BwcxXWMeNtP+BogSDu93O
         ANVupZMqbTbsEAtU57Z4BZWurabZqhUhW10Eq6Fm8GAL9YCRY0IWDPQKAtTsDe6PXdCP
         VHdarepZTeEGLKpRt0r0YXTqlCkKdWpQjyZAe4i0f+COTqCzQipN4pwy0jEnEdW/Cqtd
         r9DGrP2hywWP/XaBHGACTCOCFILa6jWAKDpz+NrB1DYKv9k6YXBqvS/Dl+vsA0tQX77t
         LjvtitCn3bDCbnwGJZsvS4iJqzv+qbTvjL1vmmETIoID7tsZ4Ia6Ub3uZwuD51okjYTf
         02BA==
X-Gm-Message-State: APuU4Z938D7b9oiT9sxuqzl2jIlEYyrN5I0F3eFQj0dvPakVNk8Hsdo6
	V5vtX5IUrNrGYTHEvnq5rGrm+cD5kLcewusCz1BsXtEPI27YlHaC0ev9DKMwImp1wTCYO1P7UB9
	LYb/ahni4CG+LltJ26ddiSUz2LBkmPbF6aw==
X-Gm-Gg: AYBFou0vxKBKit/8i3LrxbuJXCBkdBx6BeyF2I+Sf1cJpEj+waPsybqOd5aXdoS+pPp
	TkZ/yPGHhwSoZHZtkOX4AdWwVSCBAk4Wp097H4C6S3ywSUYaglcqdZtGLI2xBGbYlXaZw5TExR1
	vZ5yWiex0q33TctQmrjg4Poovvpdi1EXV9fIkSWgEcyGUaeOgAahfuiOjLIvFg1nO+AgHwCrvCo
	6KGr0atKzAoYMsd3u9OslNGjhOtFm9C5qGEZRFRPfGckZxqOGy0tXibVeqNR5KcgjJWDp98Cz2G
	vjKLjrOrNnMnArTtqs6JiM/pjaOOD7a3RnUFCno7GEj6enxzEFy1M9o2qnNedfievt5Bb1LfDVE
	Mj3Uh4XHptj9E3ozqCs4EgdsEHaPL6YmInrdP5OBxcfnwN++c73BKaZbWJqSlz6WHOP+uaH9Btf
	dPYWR0bumCN2tSYsWr3FMF89qhFwrOGD/J
X-Received: by 2002:a05:6402:4504:b0:6b5:4fa7:4f49 with SMTP id
 4fb4d7f45d1cf-6b887da1449mr1206797a12.6.1794984123426; Tue, 17 Nov 2026
 22:42:03 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CACVjhxVo=0FJMA1q35bP3-1re6Fo55vbSyEr+uGRsR9cAjSBjA@mail.gmail.com>
 <bc5a6796-952f-4949-bdd8-e0d1deb0ab4b@linux.intel.com>
In-Reply-To: <bc5a6796-952f-4949-bdd8-e0d1deb0ab4b@linux.intel.com>
From: Yaron Shahrabani <sh.yaron@gmail.com>
Date: Wed, 18 Nov 2026 08:41:37 +0200
X-Gm-Features: AclHuK_uxSYqTDBkhmJlwZXlJtFDSnXosK-Hf3q6WpEoepeCNZnRr-BJ_KGP02Y
Message-ID: <CACVjhxX+jy5H-4GMUqLSrZ3wcnu=85mQz9o4tV8XbdgO3FPQUA@mail.gmail.com>
Subject: Re: Audio driver fails on 7.4.0rc2-3 Manjaro, Thinkpad T14
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the quick response!
I'll update when it lands in my distro and report back if there are any iss=
ues.
Yaron Shahrabani

Yaron Shahrabani

<DevOps - Hebrew translator>



On Tue, Nov 17, 2026 at 11:13=E2=80=AFAM P=C3=A9ter Ujfalusi
<peter.ujfalusi@linux.intel.com> wrote:
>
> Hi,
>
> the fix is in 7.4-rc3
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dd00ba321499c0050872d70c41d86069f1d52c248
>
> On 17/11/2026 11:04, Yaron Shahrabani wrote:
> > I upgraded from 7.2 to 7.4rc2 and found out that the sound no longer wo=
rks.
> >
> > I filed this bug report accordingly:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D222284
> >
> > Thank you!
> > Yaron Shahrabani
>
> --
> P=C3=A9ter
>
