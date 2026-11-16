Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837653;
	b=SQVLuN8t5Z+X5zKBPv2pvvXOKAR3HjAEdLtH/H/2S6iqVrI9e93biFk3dkkQoHyKmB5y
	 8pYZXl3iu4cy+aoRuH+680ueBPa9ffT2dy8LakbBZLRvc2bQDO0mBj791hOeXdKC/tZTT
	 GloD0kShxfrqVYXPTtNGfKjEATMB8PcNXogMwk3DhfLTutRcAgHaD1yysBnTVh/EduTdZ
	 qkXN1vuwW1avUYHlOFvdHyam96bffGPA7aaJbr3HuvgDQqbuCVN4CmwwN41zLfGlGDZ8B
	 rn43NY/VIGJNqSfrpPogi3FfAntFrNHTySOG+vf/Apj2kFK5SBQNuQyOyoeK0WXJmYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=OpbigILsjlVrGDWAwJdeWFNTdCGy+FjbSI0FI75O3M1xUTW+wGirS03Gt50CgIuHw1i4
	 ckwhyvqKC24Vzqd73AYqvOVWijL3quGSycTOiUMJNbzdUYFJ9JXPU7Q5TP6nrTA+SEHMb
	 ohPmNJS7afovLoyN5JCnzT5Q3A3M6xWtKLlNhmiFkwu+CxtbWperrB1xRf2Qt05rGOrvE
	 30kck1MZTbQdqathtIYTzQjJ60FAGasHsxL0GHjVCuLI+9CpmRIE6oipQzTn9V6sZQ8QV
	 WrJzWEUNIES8yiq9mE7NDl9kwvLxVRi8spK9bD3o+52uw2CdD2fHA8bHD/GtHl/MTbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SbKntM6h;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FB8606A32F
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 14:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2FB8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SbKntM6h
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so6540048eec.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 06:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794837652; x=1795442452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=SbKntM6hmkycOhY3ZwGCYI02rg8UoN+cEm5PdhdrRa74JUmTMI64qv+bbBrnpe95FW
         mVIewRlkJ20frSiSkuaSi9tUEGKk4xxuc0pQp2MZQmmmHtJaYqzA3On2cvR0+FqtRXIz
         shcyKvEmk+PhBl3HmJfDy7qoenfKhzsEJtSbcPuDNDsZPlrgjhYhyLy6wAPvkbCf3Fr9
         xE8RjCAtxjDN6wMHUI+r0SteVLwiK184El8EqPHf69iv+7+B/R+HaZy7O/ZHkDiTKJI/
         lbFCngQB9e/SvL98CY1T7ftkUauaZ33zchHOPH8X1xNJaEBGgCU8V/97Rm6B6T05dhJG
         46wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837652; x=1795442452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=JBasBrzUsFkvusnPKGNxh5VCb1R4azjLNGnwafo4j4RzGb/zsXZfhctlrYoI9PZ3lJ
         wLo9PyziQcFVrLaJpD7iDbLKTXm3lr84rx6RrBBhEZH/knHBol0628riyzf7DqZ1bygD
         akWIDexvHYj9H/yh7FGEkFy3D64rORGyRdsZppqDEtUENPWDFWceOmmLCoBIEfN8YUoQ
         aLHT0DhopMvMoV5zI5szU6acwef0kkOKQ+peFnsQ2rkp88DnphE3OLfZddZwIsi6DWxA
         8TbPWqcKf3ubTeZ9Q8k9rL6G5xEPcTsHUtYZqXCQz0zyEhxCBjj9sDnaZDOh2YAoH/9Q
         XmBw==
X-Forwarded-Encrypted: i=1; AL+hErF4uwp2fXhH0KoyPljL3gEK+D937aeXtq+BIWEf+xvQRxMmYuJ05eGpSNGzoo6sTY7+tLzeGnE04oSyUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ikDzF769gqvLwuUt3nWu673D8Retj/ydIuiKCz+SomUMycP7h
	MrrZ0fMI4uzCmly4L0SRmaw4WuYc+23vfFtrlUKIjy11GevZCzXE/t3+
X-Gm-Gg: AZFdTZeJBN+1gT+MB6yLxyjLXgqPLbsLFUXurxHa5KjuSpSYonSBna1xZZ1/cYNDFTA
	OR/YiKJgsuvXt3eQf2fdykmP4fsEYP2PP+31GJyTUk9VErvRqba9MMMZxYtG4KUOmGZi5EU4NZo
	Pl5WdC27uSiTWfHAg9GWt4iawd3JvkQLMW6ZEDQPYAQc+UHATt0lkzNSwgi7wgT+Lkb4LmNVmnG
	0sOUNpFYzocZk7DRi3L1YkEgm+9MYQBqzupdl7UzHStXfiTfd83Z6tnY1fzqwCV8jEjd9F+w7nU
	hl5S5Epv47sRIjt8AuRusJ2x2Ff9Nd4B385Az0RkFgEBEhVfcK5xr24uZnX5n1C5OV8Zv9PYkwQ
	bHG4+5lJNZCt4pdzieF9KBe9p+y+lUViZah+B436Dhqq4rrV4udzopfX9HhnSNjEwbcwKBs8Q2v
	MIRyp/ffk0bBs+LLkV/0BzWOrdK4/wriXclGpQ2c1kRpCktC9EtzoRSSVLLKtgL3TxrGUNSzXC4
	AsAs75mv1JWd20nyLDXTUVV6vt+FA5NTegChW1SgXHOqE+xR+M2wE6q+8tT9qH5nc9rv0dB5YZF
	gwY0JEWzhfwiFex6XmQjfyKmDVJJ6wr2iN4UzmteoWngknDmBF8=
X-Received: by 2002:a05:7301:1a0b:b0:36c:9e26:88b6 with SMTP id 5a478bee46e88-37965ca86fcmr10517097eec.9.1794837651569;
        Mon, 16 Nov 2026 06:00:51 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm35118495eec.5.2026.11.16.06.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:00:50 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: compress: Set metadata_set only after successful callback
Date: Mon, 16 Nov 2026 13:59:51 +0000
Message-ID: <20261116135951.2607-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87ecclypxy.wl-tiwai@suse.de>
References: <87ecclypxy.wl-tiwai@suse.de>
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
