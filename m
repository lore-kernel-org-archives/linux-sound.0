Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052785;
	b=HcFqviModU5b8uOZagvzwCX0bJKpB2YHXbYi5LNHLbwXAU+HMviX5/w8fdihgWkywGPU
	 uYQORerTvgV7DuUUq7raF1XQ1SWiexQnq0rh351FeKRg2jqglgCMN9mt+vfk/06l1epXj
	 JFX7CwpeTC1aWnJlZIXAM/HGy55Hmc8CR6gWluGEiBUr0+8OJB1X9wGfF0L0K5YTe/Txf
	 ue2FKb+1Y1Pw/gixARhs+ZOUlVOQmvnZznS+jRIC37NV7CvHaXIHPT/DnQgY8FTVhroUx
	 gbbo5cz3QCkAfqDDKO6kRzdIwXYV1K4rZ+ZZ572yzc1RjOBDcRHoxMdDS1BH2ojXhjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=MPOjPTFT/Z5QnlnPUwTEPnvim5XUD6JJBOIn+vAwSYSe5uLxHm9tGiRdfkzdSyppcead
	 yf2MP7+hSCk7wmFyzVIN9Kaa9sPhOQrQnFVB6hhi6V1DmDebnhZyicyforSNStE0J/0V1
	 sYKuSSSmCAfKD3HX9L8zrF07pK8VVC9+wbBQ8N7uxi6QSwRH2pXWNLal/VgVml+0WDefw
	 1WZyzQ4o4llbiQ2GrF/i3pn1Wn3PY2TxaKgZ+IWbGNjQg4josewlIagsEEfqS4qduFopF
	 0BomvPnaXmhi4v/MCyhZYMh6scjJhxpyajk8FNRSm5dteyau+dO/AfXc5l3x5ART+0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gLwiEvTU;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B3606A32C
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 11:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 573B3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gLwiEvTU
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2454032eec.0
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 03:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794052784; x=1794657584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=gLwiEvTU6LQNiCczEgb7ofrpKDseU4lpdDPT6FM0Axq/c+Z8/S6x1WMK7PSQ76506u
         a5tGzgdKpOGxoM3JJy6vrijKmOg8njGcasIZzi5pK9JDzPr/WNXcQtMY4nG5Gdb8XDQ/
         RcYvdd0MeMDCeMPmLoBOLV6vKw39bvfjYwqxPLP06eQYhtcxlmOMQ6hreJxH2ps6nGCr
         Ot3Its97LdXHbOWZqjclaePbB/aaONjoOH0gs/PdVllmQaumN8gsVUSgYJqBF8xYbYnP
         /+H8mr6kR8gP7noszUgIQ538IACbfmy/+wOfaAMVDufTbeLCs1W3u9exs7fIdxCX6kmJ
         WLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794052784; x=1794657584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=kzhOod9Z3/gVsVF2FCzyd34Pypu1Sg6eqiJo5ILfHxGsk0AvDa9pObODG0LHWpOUWb
         6gCBbfEACZd4qjV3Yzy9aHhXg/YK0Ow1nhsiO/ZGhKD65RfKL0JEFOu+T0oni0+Z4+7n
         8tZFtr3+WxNC+UMRKhhhaQMtPwR5nCTIHF27k5joVgNaU0HS+5mnnb3euebSbbg4kSHM
         AO/Bi4sk8x+mPZNwD6LAPEnzfZwJZ4E/8Fxv0H8vRAbnFe/0wJoOhQ9h5wRi1XPASzuj
         87uH9aDhqUqC111ECfTYPCJarULaUWTx544N3q7SOcIg6bYXoVduVtwUxDMl8c55sQ5l
         fxRg==
X-Forwarded-Encrypted: i=1; AL+hErH2p++YlVOLcK9B1OI3KM9PmXqFPud7uNEqQKDrFB+I6MQMn/kSTdBcRce4s+WK1uxHnwJvygGabB41Qg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/YCHaziPSWbuCEg8xmp5tbLsKQ+k/RgSrnJPnJVc5RK/hUvhdT
	rhW6lzS3qHpuFnWONFpdD1eFnwoFIc9zC0yYIHaiIcaR4O6pQWzWx4sp
X-Gm-Gg: AYBFou0Ne3eMKURLOC055CNNCmBgdt8JXwKKKJLOpfklthe5VwOYJtNVoB7/JmIng8r
	z646KhUzViaYn8ZxRLzx2OKmTR5gtKoYkyc77WQuqhDQITUQRtcdfwibIOstoae6aGkDq1aCKLX
	SoNWehmop7BFvjSGIol6yoeAdvNKA7bU6FHmruFzb+7SyRh+XforOU3Dvnm4Okg3A5H+fgCormU
	Fgq4ynN5MbX5m0z1jvctQ0P5JBvv1Ia8gXboUXK4QHaim3vkgYYon0o1x6LXY2B0oUq8N26qgsz
	qgGDrur90qXK+PRlIvssBF33dzZo7YM3JpAXB4UrZCbn5A0cJRsn44K0zRsecZE61ScigIkkD/8
	BYCAm2z/rW9ru4YMZ1J5a8R2pHlJboBORdyQ+EU76dhoQRBAGIHB2l4kn8OcXngF4iD91OuwaW5
	FZa6QgzYTUkCdI8wvWy4hXues4e4KH1NqAZI90ZiOBNy9opskz8WZFH1Lr0+rmWSTP4HDZufpU3
	8xeRlI4xY+P8r473FVkJRihR045nJoG6UiR8/A1DTKHKcBehFsXeIOvhOqZrKiNZZhMmFhylfZx
	QvF0sZzIl9zb0Kqokd90ZAERI9tBKTPm2gLyqPYnXvPER0/oUumBnbqohvioGYimQJjU97TNxiI
	=
X-Received: by 2002:a05:7301:4145:b0:36e:20ee:b297 with SMTP id 5a478bee46e88-36f752549f1mr7137941eec.6.1794052784325;
        Sat, 07 Nov 2026 03:59:44 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8d44500sm16111604eec.5.2026.11.07.03.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:59:43 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Synchronize LED mode accesses
Date: Sat,  7 Nov 2026 11:59:23 +0000
Message-ID: <20261107115923.2841-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87eccxyplk.wl-tiwai@suse.de>
References: <87eccxyplk.wl-tiwai@suse.de>
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
