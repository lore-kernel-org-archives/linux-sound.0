Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888066;
	b=c4UMMoZU83+zWVGqIudN9nOaj2X+zClP7Vxsuk6WUbyl1KlcDoiZ4jbjmDjwr1N/Wq4E
	 T4BDawVNW/YTAdotydN/5GxlpIU8uw2xliSLv1+tZbrYjwfqyJ3fzVrgvvfe4iByuPDEW
	 ZPwKUlfKEyTQaQcytLp3Ra3t7agFgxt3RAm0M8KlUj6WaR0Sk6fN3FPbQgoYHsiNvwrKW
	 0xKvxehy1Rb6O9BPdRqMgirJXcNyWx9+R95IzPJA+vn2QCH1+PdCDkhQIxR8iHc3603kP
	 /XVQBiOPhHrsSTL8ZAL5GNYOaI5dDZ+2a1m2fPB+Kw4zUMRUntetzp3Y8IIoYWGxpRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=zNmPCIQIkH+XpnI6DH+Nhb5WlIjRY2h95tpkkN6dzNJYR25mXi6/11Vw7llRER7LdAxK
	 GZ8h9yFb/gDhWSRfZJxqv4g1UTnl4+KZO7wXkL3SXoz6IeTZfVKK/pRf0NuiyxY6p8Fzd
	 jud+0PZBuiVWHtumWnTi2nUwNRcPG0ZjBc9n3TncqfHEONtNmuuEwgXBR6MG9inXN9o9i
	 tAGQy4oRTjwiHWSJOL/iVuKcA9rRFtD5MStHIIPFy9pmfQCCQwl40eaaaJmxeZa3KLmlA
	 4/RSIYb+sa3LB+l9I797JrJcwpeAVL9G/DN8gm4qxVnkMBdAhDf3PYT7kTk1DqzUmqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfB5cgi9;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE97606D817
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 14:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDE97606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfB5cgi9
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a1947498bso5439797eec.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 06:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793888065; x=1794492865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=XfB5cgi9LHp3NkwPaC+DtMZZbSKB63/55LR2BLwVgihYMxwS+xooD0/5NZJ1GEVhyQ
         2Xt8QSwAm0xlRbn6Bv0FlwvOF67YGj2rm7ZBR4a0aKp2FhUPw+ib3WM3jF+Tpw7jzSsu
         +8iWohauLhCNpRhw1YVzhBulBBPiIEzDDSCU6ZOKcsjuOpyU5byBq/EARwRk9yoapZKv
         wSkR/83QKaSI2xsYvZu8PVwdQWG6TVvNPIFJLjKLBvBYsjRPFTNOIlC09DPl2EFdArtM
         Mf0Es/fT+0KBRgdlUAbX44ZIMghDe4jFpnQr7iB0WTtVCQKSSW0qjhOpQGSVX+WaNjl2
         M5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793888065; x=1794492865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=iJs8tXKO9WI2nYB35vQmhvfEeEHjrXziTmpbjts5GfPY9ZCPxUA2HiOPeAa2x0wA9R
         DatuGT0HkbInbEZLXfrWQuf39qc8KM+cHQ8HdRUAVBFvwiu2VpNbAgCfSzBe/CfDwXiG
         ZxkEQ/UGcOoIcMLwUCm7U3mHwOqf90adBu5XjZbIPq6cMpmxp0rsbFAnXYOIJ54lsdJV
         gAzrjuS2TG2LSosVaoelWg065lN6c0b3zKkUGYtC3ACVdGganOSQGL23L9ihrwDdWPqY
         BN8F4pl1116CmQRjBHW1P6cwf+O+YQ7YxUGg5EPUniX6pmIlImBlDakw9DX+wjdohFkY
         MjRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaw0+nkUSiSSBhKEtPDQp5qgnnZ8//g7uJ4N4lmKPVJW6RrDITNx/3189Lv0jGlc89vRfwVIQCUyt3xw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9SiYMh328fir6tLmux9woiZkHZuKdN6ivOU/CqO3KgqMw7nHLr
	9Su04lErLYvc++EfRIXPzos+UpBSVQwZilGbvU/ODmcyy45mui4eGDww
X-Gm-Gg: AYBFou15u67wyeG/tGbGZ7a3lXRFrea/om+fmT6buPuiyY8v1tjDIvgWIbfTHciGyeF
	WrR3Jqy91en6zpAyXQAy47NGLKZig7hG0y+14wsX4AN1BsV84ouxrZklbIMZ+e3mqGQC+OGn9f4
	TYMljZfmGRYHjaRFeSLcABKW3OoNvebECWWBma5gknSuf+aFHTDfbAdsu7jWWYa+pUG8UsIi2Nr
	00g2QjNCJAPLFBJLA6hhkwuAMWpvbq/knXEgcAniUOPYlSUP7duWJp6SaUvVxOtURIl+p2B2Icw
	5GXrdW0iXHbogHr57kPl8CT8JvgYiFBmRO7jnXlXF3DaHb4Txwini6VhMEWTO0O8o0SdnkP/YsW
	kfbWN5Zc6fqpI1+HfI7MIKoBkWpZsb1RTakbs5CMWa36tPHwn8nFeGT+OnlNTSuirsFkpDtevfN
	/XrlLu6W704kyHok3Fpsq2xiSL17DnK7JPL3mdrYSKCHiaRxhpq6VNKUHQeOUMRZGdkMcAMxkbu
	x5LdC8E0rzlytHu7FcKidS4rI+We7RFRe4cZ/0F5uDnpqtRbl6ffFNg7WWb7EP3UFDpJqAm4FkO
	JPk65Qx9TYmAvUVeVXHOfhXUr59BQKni6ZMkv7z4TG0Y0qjhCVHw1uWc/ZRBiAog93Fqu84DKA=
	=
X-Received: by 2002:a05:7022:f903:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-1ac55776fa1mr29315626c88.3.1793888064798;
        Thu, 05 Nov 2026 06:14:24 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.85])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm20987500c88.15.2026.11.05.06.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:14:24 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: core: Validate device type for dynamic minors
Date: Thu,  5 Nov 2026 14:13:15 +0000
Message-ID: <20261105141315.2982-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8733tfu39j.wl-tiwai@suse.de>
References: <8733tfu39j.wl-tiwai@suse.de>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
