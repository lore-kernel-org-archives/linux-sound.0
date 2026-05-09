Received: from lf-1-17.ptr.blmpb.com (lf-1-17.ptr.blmpb.com [103.149.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE53919EED3
	for <linux-sound@vger.kernel.org>; Sat,  9 May 2026 18:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.149.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778349891; cv=none; b=rDlVaqkDKEttq6fuLMAbxvZzIN+5rg5aS6ktY8OJerc7U3vVTtePkUOej3Vb+LRPgu+KYy5jklEn9d8Jy67OVPFRHSRTpZkXXI+Yy1AOf+7A+tXNCAVD2QoK/7a3Dk9RNxLHaWyxxJnQoCEuzx3xtEiUQvp8BY18kSvOuQYqCaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778349891; c=relaxed/simple;
	bh=qjTDg4tVpVz14ZRdZrTe//SJAwGP7etNZ1dvXPyhmfY=;
	h=To:Cc:Mime-Version:Content-Type:Date:Message-Id:Subject:From; b=SXyVB6+u5iJBEP8WCv0us/92X7u3Lc045tbDm1VxnQTJ4LaUVYftQcglMJZYPrdFTJANxkGhgV3pLkmN3oDMEzxD7adeXeWJ83rhJTLC3fzaFjJ0GulFoAI45U9f+9c1OcoV/94iaOQkM9aZYZR/wnhbZRJEG0Os+advBC4CY5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=moonshot.ai; spf=pass smtp.mailfrom=moonshot.ai; dkim=pass (2048-bit key) header.d=moonshot.ai header.i=@moonshot.ai header.b=PQKiQAu9; arc=none smtp.client-ip=103.149.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=moonshot.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moonshot.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=moonshot.ai header.i=@moonshot.ai header.b="PQKiQAu9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2510091218; d=moonshot.ai; t=1778349116; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=qjTDg4tVpVz14ZRdZrTe//SJAwGP7etNZ1dvXPyhmfY=;
 b=PQKiQAu95jK1KalVlLnU0wH0Xk5x6tM15i8ptCZ2uLMqXR5hF1lOWyBVCz34rKRGX8uVNM
 NEZE+iQz/U40eRxqTCg6DqVvKClzNbn9TuT8PLc1DiTauJm7oQ2W82wiLAauw+2lDaR3IY
 kIKGuCs3HxWs+JmfsCqB3eq0WA8fu7SfdgfrbetN7RFNtqMAZuaHQQys/B2OVoBsgElrgJ
 n6s3s8Cv88U3VmBTr7qAUdJBQBl6tFV7X/SB5sE8hpq5UoOzT/ea9OrveX/omXIJGWh/Uf
 Iy03LY80XrCaHKHr8vQJxYtS/sVNT3eIWY2KXNXivPGd94fYGeKbJWffXgL7ZQ==
To: "Shenghao Ding" <shenghao-ding@ti.com>, "Kevin Lu" <kevin-lu@ti.com>, 
	"Baojun Xu" <baojun.xu@ti.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, 
	"Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sun, 10 May 2026 01:51:54 +0800
Message-Id: <97bd47532c39bf4406842528adc5883ce43bdb25.b9dfca8f.30b3.4f6f.ab3f.1a908222cdea@feishu.cn>
X-Lms-Return-Path: <lba+169ff743a+2ec02d+vger.kernel.org+yangyi@moonshot.ai>
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] ASoC: tas2781: reject too-short writes to acoustic_ctl debugfs
From: =?utf-8?q?=E6=9D=A8=E5=BC=8B?= <yangyi@moonshot.ai>

The acoustic_ctl_write debugfs handler allocates a buffer via=C2=A0
memdup_user(from, count) but only validates that count is not too=C2=A0
large. It then accesses src[0] through src[6] without ensuring
count >=3D 7.

Add a minimum-size check of 7 bytes.

Signed-off-by: Yi Yang <yangyi@msh.team>
Assisted-by: kimi-cli:kimi-k2.6
---
=C2=A0sound/soc/codecs/tas2781-i2c.c | 4 ++--
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.=
c
index a78a8f9b9833..73e2c5b47f96 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1529,8 +1529,8 @@ static ssize_t acoustic_ctl_write(struct file *file,
=C2=A0=C2=A0=C2=A0 unsigned short chn;
=C2=A0=C2=A0=C2=A0 int ret =3D -1;=C2=A0
=C2=A0
- =C2=A0 if (count > sizeof(*p)) {
- =C2=A0 =C2=A0 =C2=A0 dev_err(priv->dev, "count(%u) is larger than max(%u)=
.\n",
+ =C2=A0 if (count > sizeof(*p) || count < 7) {
+ =C2=A0 =C2=A0 =C2=A0 dev_err(priv->dev, "count(%u) out of range [7, %u].\=
n",
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 (unsigned int)count, max_pkg=
_len);
=C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 return ret;
=C2=A0=C2=A0=C2=A0 } =C2=A0=C2=A0
--=C2=A0
2.34.1
