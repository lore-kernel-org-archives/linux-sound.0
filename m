Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794136754;
	b=a4vUP63iEQxTlZ6hJJ5yiPapp4+uBfBCPgI+8cv5CdBOaZ9WWVPQ4+9RG6F1psx+4inl
	 4qBFF3GxZffrfY7iPx8DQJ43MxokPSKgrIIdb8ViX0ncoHOn1jHfp5nxaYerzRCQ6N7fX
	 0J9kkKnGH8oeOPhSwuTuDZiuTvdTHjj8/PZ6rwfOcBVCMGYEy1gZRAYm90udyOnS+tMQV
	 65nKPbtYOrfI/onJBilNIjgoVfhQe5phZrqWIqzByJ8VJ+tuxLulfLphK/p/YBzHzOlCp
	 Hv8aAESshkLI8jS4zGGXBMZSDxxSh9ls5l8UzQR274456MA+zRxKdzDaGXt/FRGRXEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794136754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6Pdrh1oaI14+dH+vJtp79HYnl1GpETWGqzE+jRd7uSg=;
	b=CklGXSFu9/fRGulH/z2uxt9KHThUU/BYaKPBY1Dw8eMYtkfO75jVajzvU+mTk3pk844G
	 D0171Umeti3LibmBSY4CpjBPhZDU0ChxPITerIrUuKWQ9IpiLkKBiMiB5fj7mBCgqanAA
	 g3khPEw9oJ8s9LnrccxSVhSh7F5ao36zNgeF4fhEx9rqS7TPWvsTmYzye8s6Gpo7Yo2tg
	 JP4GKEHfIJcVELM16L+X7mycNlCNXYnpr/+pc08fhEpjpzYW5nGnfLzZq0+F/PMRrM/Pp
	 sfrdpGdOx4sMH2EHy5ChNRK5QYUxg30DLl+i6H06LKkRby+87B17TZXyGRiyzK0VbaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e9ixjZKI;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D25F606A31C
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 11:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D25F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e9ixjZKI
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2761c69fbso134426c88.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 03:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794136753; x=1794741553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Pdrh1oaI14+dH+vJtp79HYnl1GpETWGqzE+jRd7uSg=;
        b=e9ixjZKIUKAH8X/WIUau5U9aCcamURDNcm4h1WmK48Kchm1E0c6DHhDaneX2BdQx1v
         u9rPJmJ/J7s/vvodQZ7ArGv5a68CDuka0KxXmAW8lHYLkwYvxnU9sSigga3ozfixwa4W
         yOrQYkedX9WiMlUGz7Hd35F7UY2JEh4/pTSarNFzwjBzEW6wMEnXA7fpnC8AbxKv9CmC
         1/QvUU5spOjiMiQagbJMaKEASkaHHlbMVQbnF8JuOQJLSpKosKOxXpQiu5MzsQAh+GDi
         XXVYYyXgMLwkpkLjrKs2lkGAHuN2d4YHlqhn+onyeWXwoEqX1hD90zYL5OGwgZbOi4ee
         1bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794136753; x=1794741553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Pdrh1oaI14+dH+vJtp79HYnl1GpETWGqzE+jRd7uSg=;
        b=pjrr2hkeN3YcBdM1Qh+W+X4Ajwc1Jz1rgqCqm+by68Yc6QiISwAHOQ/2T6nh8sep8E
         6vFiQwbACvWP55MWslakD2IYM7IbNvGvC+xSiSb17HoJYuGeenqD58s7SNqbO5/Pli/V
         qXygnzUseXo9VO2onom+NbDjdZd6rM8+1bRw3rfQRShlofOr02dH6JgV+PsijAEdj+rP
         PNvGkJ6LVJIzZQABnJn1p1GafEOnuioPqy5V6UzWwpYj1UmJuiD6RJZpxlc/EvK8Yjfa
         ZGFdv9qxZHKuhcqQJFCHhmwV+RMCHfXBvrFXqayiDfAA5DM5X1Lyetep7WR0BK+MaV/N
         +GZg==
X-Forwarded-Encrypted: i=1; AL+hErGHS/NENuNs/UmsLfZ2709qYiXNw8OZe1s3ZI7POx+4BPG6T7EuKdi1ozBkTCLF7VrzlLJ1IuHK7fw85Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9zOHiK31GOwqcIudGSjciwV3Al6RXo452Oa2si4F2w9XYTUPiK
	C9CXW/SrQpxXC+xfOuwnxrQyEZgFB+zFoZfYEEApdPx+pIHdRauME3P7
X-Gm-Gg: AYBFou3sP+Ep+fUMMP6l03494SIG8OQ2VnZqDzcxVTH6y4VoAquh/jiV4VVybGL34KL
	LpG4C0H5BW+hZXP6LOhdNBhHg7TI4M5V/mdci0onpWM1pa3RLy5GFQqMJB+NNn/3TJPAdBLsAtX
	14/sjF8uiE75k5pXXXcc1wmi+gz6VGWk7KakLLu8Wu+RVRtAoaR3j02+G2Otc51bbxRqNg1L3g4
	3VXWie7sH2R0nTYO2MafX9FIkKRWsxowHb1EZ8PPgz7e8G1OWfRAiINp0mQCfwYXsnGaJnQ9kCT
	sGzT99RiYY+uvNA10omBpkmiAGJ4ua90xqOKmmIdD7d/bVOuBWjg9Q0Xlv5O12hnttVTjv0aFf8
	r9i1N4KtTOnYF9U6PnirNnwkLSd0piIX09x6v6CbwZMVQ5PyNDJGuWh8HOAL8+//z+EVy63+E7U
	nWRomHWGSlYtZ9Et7FjBqU9aKTiawU5vZlU0DZMA6tC0o1tH9HJRhKeoDFSHyZNZzouY8nYFy6Z
	2nXEMOHc3v3On9OYEbw2h+9HZU1Vr4H1Xo96k0OALd309aodPuvXyahUK1CMpaNzCpYGNYWevI+
	Ggww+NLtDjpNhkTjvl4APlxvS2y9yygi0pAXUn94hly81Bzr+QE=
X-Received: by 2002:a05:701b:42c6:10b0:174:cf1b:235c with SMTP id a92af1059eb24-1b39fed16edmr1861447c88.43.1794136752221;
        Sun, 08 Nov 2026 03:19:12 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375726fd1sm4942616c88.14.2026.11.08.03.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:19:11 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Fix parsing of numeric fields
Date: Sun,  8 Nov 2026 11:18:48 +0000
Message-ID: <20261108111848.2493-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87a4njy53s.wl-tiwai@suse.de>
References: <87a4njy53s.wl-tiwai@suse.de>
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

Hi Takashi,

I compared the approaches.

Using simple_strtoul() would provide an end pointer, but it is deprecated.

Another option is to retain kstrtoull() from the original implementation 
and apply the delimiter-first approach. This would minimize changes to the 
existing conversion logic.

However, since the destination is an unsigned int, kstrtouint() better matches 
the destination type and also detects values outside the unsigned int range.

I currently prefer the v2 approach, but wanted to point out this difference in 
overflow handling.

Thanks,
Sreeraj
