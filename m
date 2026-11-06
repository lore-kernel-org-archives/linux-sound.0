Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970771;
	b=y4biBsfedtmyJIi16ZtMaKyql5JEuIO9RYU+EjJKUIdVC/sAmXnUlSGZkiJw8Ceg/GpI
	 XcAA9deHniOexGyzG7fZvvVF10x9BmpaDSEpS3GfW4KcA9DT5neXmlGuig7B2TChYFTfQ
	 kiIbnmppVArPvnAe1NdSymvVenxqnaSAZQbx1FiV8hBBEoKKFXYSIdGCCkuRNgMboSnyw
	 kQO9kpCR3m5fEFZypQWhW6XML7xhuIJvHV8B3E8Iwoki0cbMhpZb35LnFCjGm8ApS14OT
	 LWVmbCGYIOnrVjCZiTIUULzCrocMm+HjPTGfyPHCSZ4SRM8RodbIO4D2+OtZX7zjRVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nMQFQ8BDOrUT0auvNASy+gGD9i27W8XAjSSZ/gLyZKQ=;
	b=ENypJJVGerA+tlXogwwfCPN43AKbSUVZa1hUjZ/giXfrHlN9sW+UTksLsxkxApOiml6d
	 ftDqXbWQ+eAzTJFPCtdgQRlQOALZDAtHRZrO1e3D6BfNv6+d0kQkuPoZT6hkSMIoG70D5
	 7F3oCIofFZrdQ0ra2U/B2IbWFfeTYnwNKTRjhF/OGPQMRlKHk24r3j6eSwwr46H5ODvhc
	 2RKYO/gdP+/AYL9uCtAjo2X1olLLeE7sJtLfeuARtL0N3vJleI1fF+SU79wsR8nGwwMK8
	 duUqmw1f9u/cLF9Y2QbZrmsXXAqhr3ANJ8CDPyytY1cwfFlwI2eNpgjGbkZ2C6aEYIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GNG+uhvQ;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F51C606A329
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 13:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F51C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GNG+uhvQ
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so925701c88.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 05:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793970770; x=1794575570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMQFQ8BDOrUT0auvNASy+gGD9i27W8XAjSSZ/gLyZKQ=;
        b=GNG+uhvQ8wcnxqxp52uVVeM2YEE85v4wCHqopetRjF5IjXW6mPpKCobkTeIUeE5Sto
         p7OU8K8rt7A2AP7wAL0t6iywwFALw91dHLRyK4Ah7xJhka0QfT5HyVz+DxjfDiTX69+q
         S72rUgXpHMLmS4UNx0QzSMRSVpW53pmajsfIZmK+/1F1rxy2RTjVheDd+rVI3lFK946n
         78naGOo/BEcXEip6czzjX/zjdjhrhcH3ABxO8jafbynrilaSQiCcCunVRMrEwG+dyjO+
         1f/PwPS+20PZpOX4pcA8ugIiGaZifM52JLbv1mcre/rvB2WmZ2gvLJP2UQK4rbhWq5jx
         3qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793970770; x=1794575570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nMQFQ8BDOrUT0auvNASy+gGD9i27W8XAjSSZ/gLyZKQ=;
        b=dAF0bI7o2wJqjvkIzINUlxNJHZ/xx2RFnzzbS/W6HjuuLcByUbVMaCv5+JPStwtsII
         LTN+J/QMy+Uy+EBuvB8iBYdPWHnph2PFVdDLWo2obq3UoZFhvDfdKuyBgf8kg7/SnJDK
         bBoAijHcbcvNvKcTnnMDWQMIwJ5yoB3SzfEs00cbPyqCtC2miY2z83F7/N/laXuVl3Xo
         SOJIP9Dpp+rp7cVwrUG1E3mSPPbow6gRsa+cgnCSllOZudiTcOketm9UJM1QcVIBmaNa
         tuiadW1f05Q3L9plGXglZyAEFCK5bJw+7DfIhw5oqQN+mt5mInhmeRO8VpBPYzCjqvn5
         x3Pw==
X-Forwarded-Encrypted: i=1; AKwUvBz9R6/olW7SxZ0gHt2xXMEBkvBbBngD7bc2OBLFbFVhullrAPNjDQi0ZVcWEm7rK3sVuDGjgRnRUFGAzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+EKLayL4YBWgPzCcW6amTlHB9P821TA3N62TYwYEzzls9HVEw0
	b5KON3HLkuLKXLUrQ8TZq2DG5dL5ozI3ccys1nKBqdV53iIcfgbY5PbR
X-Gm-Gg: AYBFou24iPhvoDuHTTiMxyPyUDNhj4jtxpIMN1jrKd5T1MCnQuMo5OwptPuAK/2d0wt
	YeIyXoPAHtswCVqrO3xYLG5lsQZ0Z9YUyt+xZ0eQwbCrWx28K/+J7dfefe1MYQqg86EezDhekiB
	1G9/Qxq9z6uHARa3pRywQsQKUuWF9diNkjzvTEu0q9JrDd3891kn2vNDw/VqF9vc/Kv9xDgDCBU
	V2TgkSrJLbRZPEG0WRcwB6dmUZpF+Gv/ogdduhA5i2zHCqyNZL/79FvIzOBMNypOASxqPlf6mGY
	cUu/XzVvWPKcoz0nxXimEGbNeZGQnYgMRCgiCKT0pDE75IflH5doZdp8t19Qb0dUMt96OSg/bXM
	BRAwCLBQlla5Ta6bq5ApqxwVUlQ8yoa3LncEeHqk56Wvdr7s6Ovx5BWxvvNRahm4x9BdGurrNZb
	n3c3HzpDzyNS6Nvj11j3CguuCzd0PGE49J2JO8PCB2H5Z9OFJMlKQZVsTMxEA5azCFcgZbiKqph
	gy6w6kmwxORNDkF7PKqwgdk66r0RoPkgl/RdcF5RQBrFmw272OWYxh7jKbpgG42LN1PPJfkmA6j
	QNrqUgdKt/6uH1f4YdtErLrHoqlYtG604H8Ei2yu0MnGfhTwYS0y
X-Received: by 2002:a05:701b:4516:10b0:194:f017:5a01 with SMTP id a92af1059eb24-1b25d35a8c4mr2668276c88.42.1793970769934;
        Fri, 06 Nov 2026 05:12:49 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.186])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4f03f5sm5756052c88.21.2026.11.06.05.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:12:49 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: linear: Check frame count for all channels
Date: Fri,  6 Nov 2026 13:12:18 +0000
Message-ID: <20261106131218.2638-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87qzgyp1dl.wl-tiwai@suse.de>
References: <87qzgyp1dl.wl-tiwai@suse.de>
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

Thanks for the clarification.

I understand now. Since the frame count must be identical across all channels, taking 
the minimum is unnecessary. If they ever differ, it indicates an internal inconsistency 
that should be caught with a warning rather than silently adjusting the frame count.

I'll drop this patch.

Thanks for your time and explanation.

Best regards,
Sreeraj
