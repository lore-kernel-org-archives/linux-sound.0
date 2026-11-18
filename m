Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028576;
	b=yF0CEbsN9Q9PXiPBmjKgkOkQM6cfAse/o1fH02eKuoceFDt0VK6wWWXfHXqdv0YJrNyc
	 oQZsHdHTqx3h+J17Voo4oFJvQ5X7X7kXHWaN8jN3M4TcGua4guoXK2iaWM5CWmUCbekbO
	 P+TO1lOTHu8+5Tu97kk2iSZAX0bx0sP1v9bIEX0+micGXVOqtuMkTFJpdz8i2HYhOfE/5
	 q+6INw5xnh9sIk0OzV81FZN1tt/o2DN2lDyvH2iymtv7lP9VN8MfY8ILwMIPm/llyLuTY
	 EnNlKDufIHDaxDIN2CzqsKTHisP4pA+sSfNAmynvJ+Clp/hfI/2XAhC67qQ+9yD4q0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028576;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=41QdzkYcSwUgiOd8tpQLdajxtAzgRuTJEv/B5xKbiJw=;
	b=qIuYsxheeLiqV6+yR25GLCDnotxAK/XTJn/Ab82QZpNmzw+86DZfTKzQCZlmVVt0qfBI
	 GixVoMAIRoveY/nt2OYDM5cd0QVNYoKT7obNlY/y11yohuMMY3dEeW93dKwHIMabJZso/
	 0z02zJTAnPvjytUrdmqKXnqho8whe7UDZaX+ffCzUswAOmBa29CXSFqzhZ8d4tvoP+/0x
	 TfMQ1t4BvpqxUTphR/6MmwlIB96Z3gVaHyUJ6iJ10CB0lHP7PR3wrUnP/BNa8RYnQlHvT
	 M7NuxY9V9lsxNb9gj1y+NuQSpWzijLCHgqoqrTF3qi+dOpJHwool11jPy53V/yNe2qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=f1qLQE6t;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24F6606A32C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D24F6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=f1qLQE6t
X-Virus-Scanned: by amavisd-new using ClamAV (28)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028574;
	bh=41QdzkYcSwUgiOd8tpQLdajxtAzgRuTJEv/B5xKbiJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f1qLQE6t+wm5LJTtgjED06FgSeDAnSbBCArgQAtJ2E97RW68PhzX9AxA5HesAMILO
	 uIeJxwjGz0sj1i7XbXP5GiT6BDqw99jDgxJRyXAJzeQQiu/Fv4CVAy17cc8g2PjXH6
	 DnbGNs280Lp5iM9IdTKJdV1Wq3kksY2IP9K/3m5KUMoco7ssvHZgTlwYvcYUDM6IAx
	 L+ELqN/53SeopKpILxYGOIKw9epqNj3TzypLPcOgzo+uyZMegZ+1VsET9oiN9KWA2W
	 wc2Ne3KI3Jq0PUosa9DXKv0v1nElVCGeZ7U6pZ+mJ5hhGX4VVR9BqVvBKMqZ5bQ4zd
	 2/t+hc/6JfJHA==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 19BD41BE1E0;
	Wed, 18 Nov 2026 20:02:54 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 04/22] ASoC: rt5682: Remove orphaned rt5682_register_component() prototype
Date: Wed, 18 Nov 2026 20:02:01 +0100
Message-ID: <20261118190219.316811-5-amade@asmblr.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118190219.316811-1-amade@asmblr.net>
References: <20261118190219.316811-1-amade@asmblr.net>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rt5682_register_component() was declared in rt5682.h when the driver was
split in commit a50067d4f3c1 ("ASoC: rt5682: split i2c driver into
separate module"), but was never implemented. Remove the orphaned
prototype.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/rt5682.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index 74356cd7fb45..5516a7e22040 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1482,7 +1482,6 @@ void rt5682_jack_detect_handler(struct work_struct *work);
 bool rt5682_volatile_register(struct device *dev, unsigned int reg);
 bool rt5682_readable_register(struct device *dev, unsigned int reg);
 
-int rt5682_register_component(struct device *dev);
 void rt5682_calibrate(struct rt5682_priv *rt5682);
 void rt5682_reset(struct rt5682_priv *rt5682);
 int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev);
-- 
2.56.1

