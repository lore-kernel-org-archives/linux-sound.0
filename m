Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866624;
	b=4jxDzRTUTKoYM8VBITeAHGZlXifpE4en0pZkNgjLPrEhfHtkZt9O140yTa468bX3Poyd
	 Lyz1RVi851a10KNlqOySilKmP6y8CMoKumXZEYHmCfcNpNN3kyEvsjYhf5b9k4E0ZMvce
	 qaFIgDhpL77XR+qkivWRvUu6+xfZq3xG5cYU3S+a08/fi5JaTpoc6+1f+0nQAW+cE/jn7
	 xk5sv2mg5dGu+YnRNocsPM9DUm0EGTA5sL0PNNrvNXSovugZ023YAg7VFLTZI8dRx/p6h
	 G7U7ThxgIUqcvEyyjBD7cFkL3UQSm2svKGH3nkcJu9XUPl16RrhxKBzFoYRBhFJJ5oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866624;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=m+cxQs8yTdgDvbABlUHThuxHL2i4RK+nNcUQlxgwMtk=;
	b=wKUDKGvrfP/4TrKMg0Cm2SQKSdM7KWVO+JhWpo2jQ6btKjOkZIEOSK8Te7WUsB6YUNKj
	 VQXqGVA8E0uFqY/HsNpb/BCxR1cIewoaAVQUGlWLKTuaVIT0Fey5g6bXtlda/mlApEGnk
	 10ure0L/U3fBA6S7sgJX1uHFVbg1iThn4YBWB8nK6Gu+ozY6BtRzO3mB5JiOsiurpsj0D
	 b9s45axHhgkM/kKSSIqGoymXhBrpfTX3x8z4sQwYyjCHF3sJDyBL/J6/s9+XrUnU1oGkY
	 mXWtk+isjC+MgQPgj1uX9QfxUB2IhlyHHvvDDuZaLKmb7j2zk9aXxr08XoI/J9JAjfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2EE606A329
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 22:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2EE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6767d92cde6so4080388d50.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 14:03:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866623; x=1795471423;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m+cxQs8yTdgDvbABlUHThuxHL2i4RK+nNcUQlxgwMtk=;
        b=Ue5g8UST13s6OZwC6Qc0zvhAUcwVB7p6UIfDyqnM9qJZ9yLYwr9zhJmsOaJB8opY7h
         vOIuO87kEcpKhSyQu7s4AeGZkEUgcB1YH3eb2AMsG9FyYDKTFj5p3LyfLDapWXUl9Dl0
         oepw1QY3aOcBdiBQsTgMA04ciCKL3oPPuAd/CcmB1cN9MxBv93uXDdkzdbNM3gbCutrv
         wqvBoZDZu8+Hdy3qQxJWiunENl9aQxgPVMwVC/r+cqF/28ALeZV49AkuUhbf/A+/Cwx0
         OgD4rMVztzeAoYFZwwC6jKkSqzkfYxV35RkemMyouIjEwuNh3CCXcOg1keoXELdzSIjL
         0m6A==
X-Gm-Message-State: APuU4Z/tCY+X204WzGKLf8m8t3xIgyCCaoQDtc2MBeB1vttAOI3YKN/M
	3XoN8GjPY3qMm9KhHRigzMYbjWsdldy2nkEAgu0Dlvxv6goAsJJJRYG4
X-Gm-Gg: AZFdTZc4XXoXwNA/hqYaxFWsChAOsSF/a4pJYPutMyktD8MOibY2h8Q7l6P+d5pYJjP
	tzYP2FB0/Mf4/vE+N7YWGs7SDyAO8c4bm20wNcT44TV3RSt+V+Q9sjjHV2S/VeVUgkjKVmKG5X6
	0xIEz1N+b3jrTFcksQrtQfcPknJPYBPLNx41HdREPZ9Cpw6MjACmg+CLTUaDCS/Cx4BVTURcByK
	+ryAQoZJ+87IJhj3/54RSd/b3crVwWsl+RAfHs3EuIpWr/v4kRlW5kVjQDD0PxqqIzqnC3GwXnz
	Vow3T2fIcAfigPxTypMJZAVM9QOMRpRmtjfbyuILDVYrx4USkJRGQhO7YEcegtY1sRe6D6BUqq8
	pMk/GPI4NfotmwxKaddeAAsjUlHnX3M0WlpezuFGC/yxO4WZNuCmLS0hzCkh1N7lHwWplFtxVOh
	W1ODUqnlcQWtLJqJcsKG6smPTFiTUHxCzPzTvYNzpvVdrJnmVwZoMsjgjlB43nwl3XKBs+RACkn
	thOwmlsH3I1ZB5WaYJRYytBNL3CY2NNfe6Z0lZqc0SyyXQIQ1DmjJo2kaldtzG3ABDqhRzvNylz
	o8zdTG786MbwNLu07fjoa0nC8F/QWrGCM3sp0vZ9bU+KmRqXRjBK4liicM9j3dY4Nmdj5oatu2Q
	GMdyYq6G2/xvfr0WH8OrPyqkNxrOZgbbLqFY=
X-Received: by 2002:a05:690e:169b:b0:67c:3484:f8e6 with SMTP id 956f58d0204a3-67d8963cae1mr7159104d50.38.1794866623596;
        Mon, 16 Nov 2026 14:03:43 -0800 (PST)
Received: from josephs-mac-mini.local ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a629a2dsm11133078d50.21.2026.11.16.14.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:03:43 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Subject: [PATCH 0/2] ASoC: ti: omap-mcbsp: TDM slots for generic cards
Date: Mon, 16 Nov 2026 17:03:20 -0500
Message-Id: <20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQ6CMBBA0auQWTsJU7Ear2Jc0DLAGEubTjUkh
 LtbdfkW/2+gnIUVrs0Gmd+iEpcKOjTg536ZGGWoBtMaS0QnjKFPGLzThGUIqM9Y8Mxs6dhdjLE
 Oapkyj7L+rrf73/pyD/blu4J9/wCFfJBsdwAAAA==
X-Change-ID: 20261115-omap-mcbsp-tdm-slot-7ee61348226b
To: Jarkko Nikula <jarkko.nikula@bitmer.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

With simple-audio-card or audio-graph-card, McBSP as clock provider runs
its bit clock at the full SRG input, since only a machine driver can set
its divider. Patch 2 adds set_tdm_slot() so these cards can ask for a
frame of slots x slot_width bit clocks; patch 1 lets the divider use all
8 bits of CLKGDV.

The ADV7513 in the test takes S32_LE only with a companion adv7511
patch:
https://lore.kernel.org/r/20261116-adv7511-s32-v1-1-40ae8228db42@telaak.dev

---
Joseph Telaak (2):
      ASoC: ti: omap-mcbsp: Use all 8 bits of CLKGDV
      ASoC: ti: omap-mcbsp: Implement set_tdm_slot

 sound/soc/ti/omap-mcbsp-priv.h |   6 +-
 sound/soc/ti/omap-mcbsp.c      | 155 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 159 insertions(+), 2 deletions(-)
---
base-commit: 7cd6b1fd8f9c1fcb1da1b761d502649f50b9800f
change-id: 20261115-omap-mcbsp-tdm-slot-7ee61348226b

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>

