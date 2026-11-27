Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799178;
	b=XRxQTYFVK735cJOW7WXafYSSYJawJVAZvelA1tF2C+75K4rdht+9aRr6irk2CpORUdUg
	 mabL6u8ETaKKUpr/h3C++Yxuhmt7ATuVwRS0odqcCTNDIf2Y2D12VszK4eWrrZqEslamb
	 BHUR3jluHZm9BIOf1vwlUVDyfnCW5l3BfVafXt0jTDlzh/cEKASlKn5uHvqMOSDVougi2
	 IgfL+8ia42jNUSXT/PaJfDSXalYeFK2C+je1VbRz06h2mzvEwNS4r+giHlKUOuTBPWO+C
	 TqZO36d2uN6YcZcjOvkccoP+q7QjM7i3qLfS8fZ4A49GckO6Mh5b05Hu3Hcn+iiRZZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iTVKPxE+XmFmd6MvSzXzYtECoOBwSxdbWmdWP2l2rT0=;
	b=Bcz2bBqma35somCbx7zii8g/62/c4eVlsHbm9NjUc1sMoJYMnV+ULswHRXWwo2wSGFoI
	 i5rroTSjRVPmUSt19cWNLovPSKEIWhNvpZ8KsCm+Ayxpa1UY3bzpuXCWlxwEPDzAdb3/M
	 DHObOYx+ddyMTxWCFVFzEuLpwUX12f4AxOdZKiG7vnLXQrBSPiikJ0zpm/69LzBapVUOF
	 wr1/YcW252YUF5YqnlTONhnCEhWEW5AL1OtPRKUZtfHIN1S/zv6bw6+ly9iQi76ebwb/M
	 X04A2C2+mP6dujV7ysDU6oqSQVZZ/ZEQp43zT+eLbcWlLnkWpjeaKKRESWtW3HK7Q1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rnt3xMzn;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D69606A32F
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 17:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D69606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rnt3xMzn
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so6500083f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 09:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795799176; x=1796403976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTVKPxE+XmFmd6MvSzXzYtECoOBwSxdbWmdWP2l2rT0=;
        b=rnt3xMznG2a3QsOgARoIB9TCV2/u3es2n7i6uHV18P10Ne85/1fS3zW8WKOOADwEwv
         YjS6/bAxKDxdfaiyLO8F2FfpYVeH92e+pNfOXZlbO5TnmBSapElLShPoz3JDCK3el0CQ
         Hs2JW4Inv+uZCL0zhanH0pj5hxYVZ9KOwniXJjEY90MEEDVr+CDinQWBmdwp9B9htn0J
         R0jLoUGohn4rql+68sWkT1QMlvjVUaJvS/oQ+zy+hP9+fsGsMcXxyQG5fpN56QY7XEav
         Ym9E1ZVE4he3PHKNuP5wkkWDIN9Llpog73f+G0A9R72QQ/Vg/Hm5GLiVV8iApjg67QKr
         30Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799176; x=1796403976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTVKPxE+XmFmd6MvSzXzYtECoOBwSxdbWmdWP2l2rT0=;
        b=KrevoURNPdZUMhuiufLP0okjRh5Qa7bsIbTs984nT3hwt3di3P1gZGNTF/aT0BaHuA
         Xe6blUaZ2ZXBQO+owIPmW4pIN+xhVrn4TcCMlTL5KObrkqESc7xlRcJqyDnMq9Rlg8z+
         2gnXjG/ZF4ILW7XdIkGpXduUDbGKbufQNEfpeKfEzhBuS4HbPIGJGCl5lJjPTmSo8CuJ
         +I9fpwCepmM8cm30FB/gIrIa+nuOFpo6OHlQ1v7SreI7Tpb9+UuEXmEzW7uyJKQUCQU8
         VA9iKTS3PthDqJLkI+wJC+ZmlhgL2zlccfmlTdefO2zS+IEl2Vh/VL+6Tq3t0vyeXOI0
         8nCA==
X-Forwarded-Encrypted: i=1; AL+hErFjCP0nU5HpaNyorFUZOGIs28ZuVt1SdklxKyMVWClw+H/7LD+Z6Jb1vpmkF9XHGcCPsqMn23nK6Damig==@vger.kernel.org
X-Gm-Message-State: APuU4Z/QJdD8HTkZErJr6gzBSiDFbz7t+cpk9LGM58ZiKkktYj746SOF
	k3aiWLEI6osZKVNdeRu3hyiKnLQEmoMnKsj21yomNIduoMGT4+T7mbJZ
X-Gm-Gg: AZFdTZdHSN24MpBSV2IA2gI1AXfn4dhnqPqqnOnTbBciyoX2KUzbdg/sPrfPKDqutKt
	cJQ4g6hhdWt1xhyaP/WWTPGQxoEKegZudVHwWXoNHOj4pzNjP/SO3rsbRsWKrcKwjIyoT7fxTy8
	T4Dz7t9NVBplaPqiBGxJW3xFHlNT21htO5ee0HyobXXhw0D89PCZv549opsGRYPFc0znq2WkVzs
	bMpuLAD13Bu3oZCUwh/TdLXtuUdieIE5iCSKDeCDdsHBBRCXx1QtElR6D0DR6YBomZjRwaBFRti
	52OY3uXLF4ViO7rry9fUQ3nOmt4FlXlpCJ2EcGA1ESPUQSpJ44ZwwN4gPqlVjCPTWJU8YYM4fNA
	iZe2PFoDHUcpKpvLkN58iM7ZoTQLg6T9jqSYJRc0jNoTmgYfMWHkgmThO5Zqvq7xiYm9rfKStT/
	/x/36OMz4WtMcGr7Wbb8F2QdKLXnI1kbBVtQUa9lUoo2AVoYQhcjCxe1WrEQNXlgwYEIX0EQCNc
	FSXRLKgc3q8CiYX1AVWZWVNIU8VUeemvBrtl40br4/hY2t/AeUm8xbEUFgm8YyIT7BA6KsE/Dmt
	KwYJ2VWvajhPQb9CqyKfQWwveq5mTqTXdwFq1Fkx8hptMD5Epu2kIVtWVHEvUgpPIVYHI5FSfpD
	8oRo=
X-Received: by 2002:a05:6000:481c:b0:4a5:ebcc:2260 with SMTP id ffacd0b85a97d-4abb2dda518mr48798226f8f.29.1795799175866;
        Fri, 27 Nov 2026 09:06:15 -0800 (PST)
Received: from SMW032656.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm49324759f8f.3.2026.11.27.09.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:06:15 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ASoC: wm8962: make GPIO-based HP detection work
Date: Fri, 27 Nov 2026 19:00:36 +0200
Message-ID: <20261127170039.663-1-laurentiumihalcea111@gmail.com>
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hello everyone,

This series contains a little bit of a mix of patches (2 features and 1
bug fix) that are needed to (partially) make the headphone detection
using the GPIO2 and GPIO5 pins work on NXP's MR-NAVQ95 board.

A little bit about the setup:

I'm using a MR-NAVQ95 board. This uses the codec's GPIO5 pin to detect
if the headphones are plugged into the jack and the GPIO2 pin to signal
if a codec interrupt has occurred.

Also, the WM8962 codec has an external XTAL tied to the XTI/MCLK pins and
is configured to use the FLL as the MCLK source.

For this to work, I've confiured GPIO5 as a GPIO input and GPIO2 to
operate in IRQ mode (i.e. IRQ function) using the "gpio-cfg" DT property.

About the patches:

1) ASoC: wm8962: implement GPIO .get callback

- needed because the soc-jack core needs to be able to read the value of
the headphone detection pin (i.e. GPIO5).

2) ASoC: wm8962: add GPIO interrupt controller support

- needed because the soc-jack core needs to be notified whenever an IRQ
was raised by the codec (which would happen if GPIO5 changes its state).

3) ASoC: wm8962: fix interrupt mis-firing during runtime_resume()

- fixes an annoying issue that would cause some unwanted transitions on
the codec's IRQ line. This would sometimes make the downstream IRQ
controller think an interrupt was raised by the codec.

Apart from this, there's still an issue with the FLL lock interrupt, which
I haven't managed to get working right yet. What I've tried is enabling
SYSCLK after configuring and enabling the FLL but this doesn't seem to do
the trick all the time since there's still some cases in which the IRQ
doesn't fire. The datasheet doesn't seem to specify the conditions under
which said interrupt should fire?

Laurentiu Mihalcea (3):
  ASoC: wm8962: implement GPIO .get callback
  ASoC: wm8962: add GPIO interrupt controller support
  ASoC: wm8962: fix interrupt mis-firing during runtime_resume()

 sound/soc/codecs/wm8962.c | 201 ++++++++++++++++++++++++++++++++++----
 1 file changed, 183 insertions(+), 18 deletions(-)

-- 
2.53.0

