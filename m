Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560406;
	b=y+Ewj4iCuYitz+rkAYA1XZ0eoHoToHb/0U4H3ApYDlikvncquJa2xi/XhYp9xNtcZEqC
	 MHwC5KBfdC4qus1ARmA3GTkcIPVDfZ9yR4tkHwnSxet85Aa3JDPGOQxLOuDNaBMvxM5+N
	 iA/kqK6ZxRJyrKHGWFnKSzSdF3sdi+Wuv5W+gxkEGJSwMAn6fMYKnzxvMtc4xvW5t4buV
	 GIW3UXF+JrEze0JvafMchAEAGHTAHPF73bVzx7b4JBm1kpEuaIyXtEC30yRvQbUV2E5Q+
	 ciT1YMzKTlZNvxMNC6Ef2Fq+GSnD1QdDLN6+ZLFInKkfGiITHQPO3+b4wyStf1qmUrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MdbPg10Nu4QUmPPwJMGre1ifKk4CLtSLgtBFQEV4AHU=;
	b=nwLIZzlWQRo/3qUWrZ/ujsv0oVhWIj/vL0sSNgjIdePU+KM+U0lahdsKLjYp5Mdlj3HO
	 U6gC1Y3e8oiX2FrKS74pIUAU+EbpaiZlKMkOfeD41DqQuNZ5FqwIlugfxsrH0yuto/9D1
	 TP9PiBEWwQ0psOxNHSJBTEppBZzCfnwUhvYJjkD6a/hpywCTIf7B2CGLa+vg7r3pOx4Pd
	 Qzu8mWsHcitrQqHGwd7l1Lwx0aOrXuTOenUDZwT+OWXxY5CrqLgcm4sQLt18f69KtrX8W
	 Bwgs9gakyrzorMuq6gc6f6cLxBv0/4poKEBGMVboiU90COPqrmKW2TSEP+xKVb8TNAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tjRf3Oc/";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A0A606A327
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 09:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A0A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjRf3Oc/
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490f38e9688so446969f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 01:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794560404; x=1795165204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdbPg10Nu4QUmPPwJMGre1ifKk4CLtSLgtBFQEV4AHU=;
        b=tjRf3Oc/WVhaxuk5uYM/h8Cm57hl4wfFADq5g/slpD/8L5wJuGsP647rhZ/4mKv0qG
         ut7obRF1yW0efslni1ipWxEb2gw4xhTW5b6PDKWsCURm50k3C94a9r4vm8kNm2l38rGq
         stL9OlS62lbiNcqKVMstWNFf7w0JPHeHedqmW3xIADsWhxvnANqiZzTx/t4G2nPbnxLT
         K5cgevgyCehSCUJbm4cNxdxyDybiBSu+Iz5iZZdGYKib3YldSTjgtuiuKGaUsPGOAawj
         eSuxa9EqJ3T2y8Zv6QtvzTY0y6QiCuxBfpnOuH1tki+f4DbnM1maH/c1Lph1cH+WPIyf
         tk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560404; x=1795165204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MdbPg10Nu4QUmPPwJMGre1ifKk4CLtSLgtBFQEV4AHU=;
        b=nrowYXVJFfl16fVT18nwqqUncCXjzfYvm8lCTKzOeRKkYG3T2JfhiVg9WfuWECQHla
         jBWy4+0Lp+cL+DSClCWkFP0pglOToEH065R1PQPFDkXz8KQoEJUwXgRpyTZMOiHnxpjh
         ScWGb1Y3XKzFyFoj9SkGQVwU9fJZtt/bGNOIZMbG/xrBjUCvCl7O9FKHeWDwfbM905jL
         rFAiBqw3Ldmo1RoM3n7/OOo0M7jo55x+MPu+KCVTg2leH75o4cwu8r/3516/xaYI9iox
         Qi+rHtUO++sFo/FKG1qu0G1PnuSDrSGQHxUaWmJH+o6CvmM1JkJcIkdlX6/3b4qlfFIc
         4RMg==
X-Forwarded-Encrypted: i=1; AL+hErFrbV/xUr8DQLHCtluWlGjEAHOqZ2DY3BtU+7433emh9smHwbc70OhCtdEQo79ZESlI3C3LAXT2Ep+2AA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+CRWexxmLjCm7/ECnMpcv8PhZ8aLM+XYq3RCDb+C28cUQ6sYru
	2X6XTapTn4NSrYqZHsYB6NkzsqVG9sWNHfHlvD9Cxkt80PBhI2QcJcHo
X-Gm-Gg: AYBFou1PAHyxas6WFWFuT4x4Q98O1gqHLn0Qd7IMkcuSxSEzYZoO5/ASsfhjTBqUYyA
	RCUYw+N1lLcQi9kKTUsZExbsh8jRhJqDRz7d42+1rS6gWFOA5eQaP89+y5yzdd/fzApZLaO/xMZ
	oam1xilD9EBPLBzGdBKm+FT76uWZIzkfO/IaZikAOWPQ3O2G2ueR87bDNG5WZAQUYD6z3Mh7xcG
	AcSYQYioV0g9JgzrryOvSjwXAg7FWntcJMT8Dm5Hd7jWWFmY3WJ06jTKHEQQAdZAAo+lRVNsq5I
	PCBCkFX7S9C2Oig8i8swI2SiXPrYz+mpFGn8pmx+pLsK/jswpNn9jNsBEAmZuLKaLKNDYf/AD45
	L0h7OItvY0BK1JPmHRJjWlO7F439WvgXwt7O07dtBrJxkFsJpZrZRTwLe8w3nulajMUgJH7amRf
	bW067c/A2Rjm9WJjADMxE7z9rsyWCFjKeYMVLObY8xVsVxHFU2Y4Na+mMnwRsdHde978cR2GGOz
	vRES+9QwX3QDYLwHs/licB2at0v7RRuHswEdTtjJjqnnq7Yf5ttgiublbaeJ7O5YUnXG9HcrfoL
	9OzWV7/AbAiBzplmdHrU8HULZsausXDrnA==
X-Received: by 2002:a05:6000:4202:b0:493:72f7:1d5b with SMTP id ffacd0b85a97d-49b03217678mr12033138f8f.29.1794560403891;
        Fri, 13 Nov 2026 01:00:03 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm4204553f8f.8.2026.11.13.01.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:00:03 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: aw2-alsa: select SND_PCM
Date: Fri, 13 Nov 2026 09:59:55 +0100
Message-ID: <20261113085955.19796-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87a4ndqi39.wl-tiwai@suse.de>
References: <87a4ndqi39.wl-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Applied now.  It's interesting why this wasn't caught by build tests
> for long time...

Thanks for applying it.

Yes i agree. Quite interesting that this flew under the radar.
The short answer is that none of the stock configurations can express
the combination, and each one misses it for a different reason.  On
arm64 at v7.3:

  defconfig       SND_AW2 not set     SND_PCM=m   caller absent
  allmodconfig    SND_AW2=m           SND_PCM=m   caller is a module too
  allyesconfig    SND_AW2=y           SND_PCM=y   provider built in
  allnoconfig     neither set

The failure needs SND_AW2=y while SND_PCM=m, and allmodconfig and
allyesconfig are each wrong in exactly one coordinate.

randconfig can express it but is unlikely to find it. And the reason is
kinda counter-intuitive i.e., 110 stanzas in 44 Kconfig files select SND_PCM.  
Any one of them at =y pins SND_PCM=y and hides every caller that does not
select it.  So the configuration has to put all 110 at m or n and this
driver at y.  Treating the tristates as independent and uniform (which
randconfig and tristates are not, since most sit behind PCI or a
platform) that is on the order of (2/3)^110.  The real figure will be
different, but the shape is right. The more drivers select a provider,
the better hidden the one driver that forgot to.

So SND_PCM being selected by almost everything is what protected this
bug rather than what would have exposed it. A sampler would have to be 
lucky in 110 places at once. Solving for the assignment instead takes 
it in one step, which is what turned this up.

It is not a one-off. The same y/m shape found 14 missing selects in
sound/, all of them now applied i.e., five Rockchip, three fsl, sunxi,
four Amlogic, and this. Reproducer configurations and the failing
vmlinux link log for each are published at
https://github.com/JGyimah/kreach under results/, if the ALSA side is
ever interested in running it over sound/ before a merge window.

Best,
Jude
