Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795328707;
	b=odpEgh/JdeiADn99pqJ8IsPiiHGbAzZy+i1jEUoSHnA7lMf32glYkXigGG0/cTlHjwQB
	 A7MglcrPLK6JcsvgcBP1cPbPlFuUEzle4LIM9GlHjb2DQKA/kJsWCninzBNl2iNpTDHmt
	 QSNeGmFQlz7d0ncEo8DPrCnahTFrtZolkMbIWEvgjsabgVmkCbeTk1Ah/xdvWKThrOebj
	 9RmPEW8TcSTAYqPlR3P139l1xKP35bUsPMUwPeCjFGZyzzNZFXAPqZ96dxwMGpPgb2LQG
	 1JljuFg2QBkMRxKmu1aMONgVXAplgpkT5chISrsIwPGulgQXwf0QifdLssXouAQDhcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795328707;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:X-Mailer:From:To:Cc:
	 Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:
	 Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=egq/YthXEw7uEdj++tS8ft/aOA52KcHZKMomtFFnycY=;
	b=t9qyXxclD3J0Aa6jTaJY4CDiH9pqe8hU7HGfSetH9MCXgl26SGTKU6f9fFAnA8YyX5ym
	 tFujugb9fQWS1g6LI/NDeKTO9rTFiXPE26iZsijVqGJOId2f/qduHacJss+K6O2Ikimdp
	 pCDb+bOqxa+ZvqlAU7vYM6g3kR+hy6+AnQBEFXTDT1/XG7Gm5Jq0VsB1qAFISxY6CzTtv
	 zq/5MvL7uGhTMcQPFwc1oUytejjniUDL/6xUHzqMtr+lHmpxjzjWErKbImzSj8aHEMYj1
	 q6g1HnvcTiPZJXUG+TZp3NebIC3yz1OKmyHN2CQogMJQls5LA12ZSyOmA+c8GiYKv8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fqwqf.xyz;
	spf=pass smtp.mailfrom=send.fqwqf.xyz;
	dkim=pass header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=j6u1dtUl;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=BdNE+dOO;
	arc=none smtp.remote-ip=23.251.234.58
Received: from e234-58.smtp-out.ap-northeast-1.amazonses.com (e234-58.smtp-out.ap-northeast-1.amazonses.com [23.251.234.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C2A606A320;
	Sun, 22 Nov 2026 06:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77C2A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=j6u1dtUl;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=BdNE+dOO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1795328705;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=l0KYrP/RgtTi86VFjNDoRqnX8Rm+Q+YVM8M6VT6IgDQ=;
	b=j6u1dtUl7dvMULXBBc51gB9uQLOzDPS9UjvjZPxZIWwiBJNB09YxzZbvkMtUvrVg
	gj/mizKmWF9D7m54y+KD7ho44VOD9JA0CJjlAX2Wbnj34/4G9xlCWuViiV1uQ9moogm
	h4oThvb0Oh9tll9OPxtaDLgQUqp1a+pEz1zrZK+g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1795328705;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=l0KYrP/RgtTi86VFjNDoRqnX8Rm+Q+YVM8M6VT6IgDQ=;
	b=BdNE+dOOStIIr557WomAQuWYopx9YNiklq/DKFXaH1w5ayFoCpv5Fw8NqO5tIZWr
	sLaqZBVmDNjQQ9zLoN36vH61df+1DBv4XQVTPWnHsob+9kyoyMeOwryCiE98ZhiJX5x
	k/Y8VjwRwKp8JrOPmtpgrfTuj/LUvlFe7UUxVALY=
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: Mark Brown <broonie@kernel.org>
Cc: srini@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wcd-common: bound interrupt status retries
Message-ID: <010601a201ee018c-30715d0f-712e-4181-9dea-d1b82b234831-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 06:25:04 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.11.22-23.251.234.58

wcd_interrupt_callback() reads three status registers after dispatching
the codec interrupt. It ignores read errors, so the loop condition can
use an uninitialized value or a value from the previous pass. A status
bit that stays set can also keep the callback looping while SoundWire
holds sdw_dev_lock.

Return on the first failed read. Allow up to ten =
dispatches for status
to clear, matching the SoundWire alert handler's =
retry budget. If a bit
remains set, log a rate-limited error and return =
-ETIMEDOUT.

Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>
---
Built wcd-common.o with ARCH=3Darm64 W=3D1 on the base below. A userspace
test of the callback covered injected regmap read errors, status
clearing on the final pass, and each register remaining pending.

 sound/soc/codecs/wcd-common.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git =
a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
index 9016e97458..7c2d96ace0 100644
--- a/sound/soc/codecs/wcd-common.c
+++ b/sound/soc/codecs/wcd-common.c
@@ -15,6 +15,8 @@
=20
 #include "wcd-common.h"
=20
+#define WCD_IRQ_MAX_RETRIES	10
+
 #define WCD_MIN_MICBIAS_MV	1000
 #define WCD_DEF_MICBIAS_MV	1800
 #define WCD_MAX_MICBIAS_MV	2850
@@ -127,16 +129,27 @@ int =
wcd_interrupt_callback(struct sdw_slave *slave, struct irq_domain =
*slave_irq
 {
 	struct regmap *regmap =3D dev_get_regmap(&slave->dev, =
NULL);
 	u32 sts1, sts2, sts3;
+	int ret, i;
=20
-	do {
+	/* A failed read or a stuck status must not hold sdw_dev_lock forever. */
+	for (i =3D 0; i < WCD_IRQ_MAX_RETRIES; i++) {
 		handle_nested_irq(irq_fi=
nd_mapping(slave_irq, 0));
-		regmap_read(regmap, wcd_intr_status0, &sts1);
-		regmap_read(regmap, wcd_intr_status1, &sts2);
-		regmap_read(regmap, =
wcd_intr_status2, &sts3);
+		ret =3D regmap_read(regmap, wcd_intr_status0, =
&sts1);
+		if (ret)
+			return ret;
+		ret =3D regmap_read(regmap, =
wcd_intr_status1, &sts2);
+		if (ret)
+			return ret;
+		ret =3D regmap_read(regmap, wcd_intr_status2, &sts3);
+		if (ret)
+			return ret;
=20
-	} while (sts1 || sts2 || sts3);
+		if (!(sts1 || sts2 || sts3))
+			return IRQ_HANDLED;
+	}
=20
-	return IRQ_HANDLED;
+	dev_err_ratelimited(&slave->dev, "interrupt status =
did not clear\n");
+	return -ETIMEDOUT;
 }
 EXPORT_SYMBOL_GPL(wcd_interrupt=
_callback);
=20

base-commit: 7884221ca9857a317bf4bd81ac3bf5528f266feb
