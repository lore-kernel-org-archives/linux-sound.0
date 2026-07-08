Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BE24C6F0E
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 18:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535771; cv=none; b=DtWvoDEbVekKBkSOAx8myxV5B26cxDZuyrnHf7kfccWrDwRZjJK4es6v7T5GH76FYPYi7azoHlCkGVTjmFQgE/LIDFxXPH9zhM3tpjypRO6FxPDoFfvjQ2JqgHbUobUlTeV4PkfYeR81kftTkWpYEJVjQsjDUfiTpKrUSRJnZ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535771; c=relaxed/simple;
	bh=fQZTKK2hk7EE0WnaJutth7SIEdgHOpINHpM2CLofjkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdFVXm0grHJRIPnrOyb9zar1DA0WzJc/BFEXHTL1BmS2iuZBimykN5BjMh46m2G+6hak89UfntQJ5o7C3X22ewvEIwRAr/b9ESHJJcIrxXzgdxPch7RiCxsBpOpRaT239yJg5xoRMpXJ90ztNqMurNFwQQckUft9IPIBH/A3+wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVs9kcf4; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVs9kcf4"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-495b27007d0so651684b6e.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 11:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783535769; x=1784140569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQZTKK2hk7EE0WnaJutth7SIEdgHOpINHpM2CLofjkc=;
        b=jVs9kcf4TZRrdbiHhq/HuPNOiSzGxdIMqSd1eorQh7kBANgqPBccJduxRpUTgg9gz6
         Dthq86DXrMdDYmdSibXNgNiG28SJNLcCSlaMMT8Q5dZPJayP35LlbRymIWjGW/8RgjOr
         ZfWDJ1lMl8ebDuLfmsvUOGKdMTFQzrH9S7AAJsFu0deznZ3ezKFnludPa6Ypsu8HyyT3
         Hs5WaYnV3CjiUmYeRwDO48KQM4bpMmxqmlHIxzKcY/SEyrIWxosyeB6SKdi0+67N4GXt
         LV3hHrwy0vcHLt4GB8/kwIYLjAiwvtAWWobl97DXRAeeLffcAz5308ehioPu+Ybp8TOx
         lfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535769; x=1784140569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQZTKK2hk7EE0WnaJutth7SIEdgHOpINHpM2CLofjkc=;
        b=NqRwDVKGvit8mOi5eTUmxHBMqL02oAE3Fr112/xjpDepfv777a6CrqThK1OJpwV4GC
         6ccv3lm56QbefIsxgSqlpi+eLLHJ7ZiWlAHatWL6TK6MuQxvX0teHj/+fRBI6Ozv4szF
         CIDsp1gzhEAG/GptxRY8RRMu9KlBfDP0aebGx/2LZOvXVzZkg26qgT+se6EfwiBXLBlm
         74qsPFr+Qv3XvP1k0J3R0ccqukLT7UMQC9aGLXI6jKzV9dBLhJtYfT+ByLTLIr7C0LMh
         aa6avy7JbPa+hIfyyfgUX99Bb139UL0Cx9vTU9P0XNP8WYUpaLk5bBTC0sKpqbkQED4K
         mzAw==
X-Gm-Message-State: AOJu0YwavyHE5gGTekD9mujIYVIbSCCcasfccwO9k+3Fn7F7X3zfdmn7
	c0Lh7F451hVkMUz+n1cS8JiCiEqPMZ6gJNT1SEEjMT3QKsVd5Gkmig20Q1H1sl362tY=
X-Gm-Gg: AfdE7ckHneyLgdpn87cok96T3Wg1agyjmUhTXAPDZa9/gFWZaAbLE8XSvJ3M2dfmpgg
	3RauDMwzR3xQpCqFmhNJLCN1w6tla6fiRtnnG3eRe+LP1r+ncuY9Oo/EHIen0e+mYJrFuh1Pdrx
	mjGeaPx1KaGEBNTaC9YS0Erai2ECRb/oTMZxXAkUPcjZmjErScmDN+B7l0fFjI4aGnmef0mzi9o
	g/POap8gvuP9XEUhl0ZzWVjB9FZfs5yBXeJmiUXiQ29Nf7MLKpCyvrwAR41hahhVwXzXVN7Za5d
	1hW09C8i/jJF6PRhjXqWDBoV3V+znf0x30VxF5yHbpyAlPVKfkKK6fFv3RAcOB8nr/XaySXlhZW
	ba/z6LbYeLCN6bkWcULJARfby4UVuT2CvnErXdsq5RF1X3+nx11f1JGzdfYOxXPbPwRGMNTXFKF
	W+yONywsnnLl29s+s6j0UbAnvzdexw979REj+2
X-Received: by 2002:a05:6808:528f:b0:49b:9a35:f71d with SMTP id 5614622812f47-4a204ff90edmr2974915b6e.30.1783535769347;
        Wed, 08 Jul 2026 11:36:09 -0700 (PDT)
Received: from localhost.localdomain ([2802:8010:610c:8c01:940:5638:6c2d:bc2c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1afde6cffsm2331017b6e.11.2026.07.08.11.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:36:08 -0700 (PDT)
From: Agustin Luzardo <agustinluzardo09@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Do not drop per-channel feature controls marked get_cur_broken
Date: Wed,  8 Jul 2026 15:35:39 -0300
Message-ID: <20260708183539.6920-1-agustinluzardo09@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260707183133.8113-1-agustinluzardo09@gmail.com>
References: <20260707183133.8113-1-agustinluzardo09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please disregard this patch - after further testing I found real
regressions with it (non-independent channels, duplicated device
chimes on boot and even on shutdown). No need to resubmit it.

The first patch (quirk_flags mixer_get_cur_broken for 040b:0897,
already applied) is the one that should stay - please just ignore
this second one.

Thanks,
Agustin
