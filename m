Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184159;
	b=Izcwlze2W0OpUF+1dtKsgkhCIkdbxaeSimeru6lKQ/8wlU72yeuFYTcNf7mQziBeUxhZ
	 3TSATGy5SRmOjQl9v5uvr/d1NOEJi8xO6HKi1eHm/FnncTD/E9yu2GC+ZeWgTNN4oRvX+
	 j7Pfk2qFficzEZytccAAefqzw330wdtrwLAKqfQ5wjR8khIjAnrpJv1AAwvDOn0NOohss
	 XlMMJ0zScGddZ+41RGabgna6B87cg4F0vF1+1WH/hheJxrRBVOt/2JKWABKndz15Itetr
	 2E6S/bGdvRLi00heZJoV/em+iCNI2DvoPeeoT+Iu9IQtTzNi457VNjkSliUWLj6Ai9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j5WXt17uDzq1S69vehK8pYv6NBrvwjOvlY+NLcQB8So=;
	b=bUEsQ47LB6ONQu7CUUcElQAleu/AxiGGvmCmqDJ78PTYUVyangOVcrd393yLqXLgE6Ho
	 qcsMuWBdnKkVZ6uqCpwo4twEGHqMEQ+YFyZ9D5Me24FaQm+5FMRuSbkp7oNiJKkbrgcmQ
	 XbXMTphILZXpV4rFqKp86gNffETQm6S1cIO2GJ1oU1rbp5p5zaE4o3rUXFVVjtR6rN7RJ
	 z5k1tUY4i2Q7RtEpe6w2TCQ+3RuVjeFXVIWsWZAM1c11VNSvo8gUjZWiuzn1kPoMzyKKF
	 9WovqJuZQB6Rn4O5cJcwQ5etyXfAS85gWhS3nUaCNpFxj1PqclnRIWH7Wn22rSR7JHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtWBCp0B;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01603606A31E
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01603606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtWBCp0B
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36661f953e4so1306970eec.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184158; x=1793788958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5WXt17uDzq1S69vehK8pYv6NBrvwjOvlY+NLcQB8So=;
        b=jtWBCp0BJ76y8q1zrvKeCRWUioNxaauBwIE2cYcR2PiPZdq1IysgYV2kTZAT6eoVe0
         YjZAIFYpHUd/hgQN8MpALrsqTogiOqgAvBi2fAhQmOgpr69J1maFZBDWJhcxeul2zJ9f
         jJeGg9KsoMzwX1HkiOtmuv0elG+rWYyPdpFjfXEBhq7Sik6/d11nvOcUifQSbuRnS/Hq
         6nHorml8BEk/iZL6Y3+pbuO/c3dcFhrEy5DSGVNP19gizA/lqs54QNSm5nmKm2FiaxFz
         p0DM1eMZf9FbJmKs2Zy8pGvQUftNw85tuKikUJY5h/YnH+ibxHgfaJUiEPF+Udfj/RNj
         nCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184158; x=1793788958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5WXt17uDzq1S69vehK8pYv6NBrvwjOvlY+NLcQB8So=;
        b=1oPuJF4PBje4wFD7FmDlDuj1BikHycZRPh8dz4HEnt0P+BhaeHKv7AdOHyZbsV33OL
         R1ZHm+UvXmVChmbzRTpSxfIRsvxdzeeN6Cb3dffIgYhk842LariPbUBQ6zV0uXXUwOxl
         jH6mUx1At0n8tEPJxezmbAXPY7z/eJM+uRON6JXkixe55eawDCAVcPLxRiJj2N/vTEkH
         cNqMtXj0NgvSBVzmKmAbSZ6B7oS/Zm/rE2R1XllUuOdgE6pT31+9+0tw9I/lpo8bVV9e
         Hh7OVsM6uzAymhOmvYptPjosfzEoVWlog8/GeRXTTD3Yf8vrQ/CjhRBO17r9UeYc9BdK
         XXsw==
X-Forwarded-Encrypted: i=1; AKwUvBzBoeaBYgWYgV2AlRKMTT3kiN3tym3eLeADL4ov1eseezfoA9PnXEa/kvM5BgfFnnDykmldtKahE0tU5w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKpf6QLYEz39OtaM2N0xXsFj9+0XXT+uWa/FEsRp12fTEubp4h0
	ch4aFZ6bQsfcFW4RZ/iCZZF2mvEijExYNvNUMbicdBTTeL+2HxjM0lvy
X-Gm-Gg: AYBFou3w1pQALn5bm8KGkxlygSNQDNlwNfeU35Qx8aWHsjFDavxrL6xxdGQLIaZ4k0j
	+0VA3fBsD35Vi2UJnLXwxUsR3tp+mjHpifw5I88hrTcDEwBrvmCVmeX9OklJ3v3G4ZDxU5/oXx+
	HTugz1cKdilxljfIUuJHKWFhBmT1FTBTeJoHjVwmrX+LqiHUeDlouXSoZEY4mEz4SEidAH5T0I4
	qvYnOP/59Dgsz/b38nPB3Nw12h1U/kxp/587DRigami2sRNZbfMMj2zomkoCL5rUeFTtIKMD7yn
	Q2uDWlRM8ufBCtNU6lOwoZgZJTXBd3ttMPuIUn9XZd0F9qRNayeK4MzVTNMZ5jBxUylXkc46Ggw
	Xv6rgCM77xbLB4QpYnaWUedw58u5LE6EC0Gwi5yv9qoIM4580MFkA81VUaSU7oos8eOYg4WizOo
	I8pQHTh/OzKJdHzOFq7XOSckPInOeL/dJManDECo/Y9d6iZx1tix7Gsjsrx5o+wCm1HpD+TVnUX
	t1ijc50zaDKtTcdY9rdpnZp4ueDcmHWS4lGVA4ApqBbAJPCwFEkIabneivwRIf8lkeo+1abG7z7
	kLlUOFSzPfT0uVZzngYplv+6PEwyqZBabItqOPZ2izuSfxEOvYZbECi38oreSEomBdT5WW4JEY6
	EYNekdRDrHf4S9NJn6MSUFDMEZ2wUILqYqexP+gdjVpCc6r+jGEuzPqtVpqbiRztIYw==
X-Received: by 2002:a05:7301:6189:20b0:354:1db3:674e with SMTP id 5a478bee46e88-36a203cac0amr2845604eec.6.1793184157981;
        Wed, 28 Oct 2026 03:42:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm7531469eec.8.2026.10.28.03.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:42:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: img: Fix clock leaks on probe failure
Date: Wed, 28 Oct 2026 17:42:21 +0700
Message-ID: <20261028104223.27007-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

These patches fix clock leaks in the IMG I2S input and 
SPDIF input drivers when probe fails.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: img: img-i2s-in: Fix clock leak on probe failure
  ASoC: img: img-spdif-in: Fix clock leak on probe failure

 sound/soc/img/img-i2s-in.c   |  8 ++++++--
 sound/soc/img/img-spdif-in.c | 11 +++++++----
 2 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.43.0

