Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD8E3C415D
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 15:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778601352; cv=none; b=nMl3HElPod9Cl+VSPTs7/WsFVLnlOlon3p2hd5EObUVmKVUeucCAnFJVS9ESMvTNc5jnIIIv2QrOWLyyZ7eTSOaxrf9eQzNCWyCm+XS3f85yDXwVyM4I8xA3B8wqn/q0HEltlUsBAVLH7ARWvTvfxcJHaRfuNyIWkmWJA4Ibz98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778601352; c=relaxed/simple;
	bh=Gjt2RNq8I3jmKQmkasU8kZYkGs0ekaL2qiKuPgMsgr8=;
	h=Cc:Subject:From:Mime-Version:Content-Type:Date:Message-Id:To; b=DSGDGGmz6U5dB35mmeeYElka+ecLcsz8aZS7HozeXYt8eAK0e1G/EkTytqT7r5Y/9S5mUHUVzNiDtuNJbAYsihVk+92u/+kCF4B1KH37Dvytjeu7f/RSxkE6+u928yKrJpmcJcVGmoEFDOLJxcE9ioL9o2I/doER+qs8v2ah2Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=moonshot.ai; spf=pass smtp.mailfrom=moonshot.ai; dkim=pass (2048-bit key) header.d=moonshot.ai header.i=@moonshot.ai header.b=aJvCtj2I; arc=none smtp.client-ip=209.127.231.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=moonshot.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moonshot.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=moonshot.ai header.i=@moonshot.ai header.b="aJvCtj2I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2510091218; d=moonshot.ai; t=1778601337; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Gjt2RNq8I3jmKQmkasU8kZYkGs0ekaL2qiKuPgMsgr8=;
 b=aJvCtj2IRcOlFhS787YF3vQ+bdb5c7qKRICckQpI8ctgUhcMz2CYsi6mLy0ZbrZOdwi4jU
 z01Sdg5j6UybrLvUnzDVYxXPAypFB7rnqdT9lFIurqa1xDoA0VtQfy0cYedFf9ZnDffMEQ
 k9gRWsHlp9Q0Hpi4QQWYyZVRJG07YuvjWl4ttlVZ8L1mpOd5d8xmCVWYoNyJNAT3zGoPGj
 ckvs22x/JjLwLiSw4dqGOrrj15jd4xHysOzEJazmRoI6SpPV44Kch76vX9p08qwVRT0Uil
 ivtSoNG1haMck+VTtdnqWL24sWCiHcBTqMhC0+yJ28YUgfTmp6CF6ciyK+EKWQ==
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, 
	"Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] ASoC: tas2781: reject too-short writes to acoustic_ctl debugfs
From: "Yi Yang" <yangyi@moonshot.ai>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 23:55:35 +0800
Message-Id: <97bd47532c39bf4406842528adc5883ce43bdb25.f794da3d.54fd.4990.b799.199289b112b8@feishu.cn>
To: "Shenghao Ding" <shenghao-ding@ti.com>, "Kevin Lu" <kevin-lu@ti.com>, 
	"Baojun Xu" <baojun.xu@ti.com>
X-Lms-Return-Path: <lba+16a034d77+abad7a+vger.kernel.org+yangyi@moonshot.ai>
Content-Transfer-Encoding: quoted-printable

The acoustic_ctl_write debugfs handler allocates a buffer via
memdup_user(from, count) but only validates that count is not too
large. It then accesses src[0] through src[6] without ensuring
count >=3D 7.

Add a minimum-size check of 7 bytes.

Signed-off-by: Yi Yang <yangyi@moonshot.ai>
Assisted-by: kimi-cli:kimi-k2.6
---
v2: fix the sign-off mail as well as using Latin version of my name in the =
mail, so they match.
---
=C2=A0sound/soc/codecs/tas2781-i2c.c | 4 ++--
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.=
c
index a78a8f9b9833..73e2c5b47f96 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1529,8 +1529,8 @@ static ssize_t acoustic_ctl_write(struct file *file,
=C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 unsigned short chn;
=C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 int ret =3D -1;
=C2=A0
- =C2=A0 =C2=A0 =C2=A0 if (count > sizeof(*p)) {
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(priv->dev, "coun=
t(%u) is larger than max(%u).\n",
+ =C2=A0 =C2=A0 =C2=A0 if (count > sizeof(*p) || count < 7) {
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(priv->dev, "coun=
t(%u) out of range [7, %u].\n",
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=C2=A0 (unsigned int)count, max_pkg_len);
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 return ret;
=C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 }
--=C2=A0
2.34.1
