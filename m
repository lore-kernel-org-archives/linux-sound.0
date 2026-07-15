Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54134D2ECA;
	Wed, 15 Jul 2026 20:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146710; cv=none; b=m8h9b18nB+0Sks1wgg/feMgvIA6JYUzPPwMPT0UAWgIkdMBbcIoJUkI5ntQaVc+TGyxFGtfkKqlNdysAC3+oMi1HRZNnvGmFXDR5m4JBZFTzUWakWMu1RzO5zc4CpwkzooeJ00wa3VnpBbcLKhIoOzfhU8HEAlq+NCRJ2RA/Ses=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146710; c=relaxed/simple;
	bh=ZRWIcPjGXHC/LgYkFOepiJ/eK9S/BY/5+ULJ/6ePEGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lm7P8KP4Ed6K2A4Fho6Yy1Bsit6IOkrdH/JMi8YdfH3/oruMZPFCq/4xJMnqsxEfayulukpP8EHJv83zRkyKPHS2NhNXbpSY+vT5XVxR391pZpfaELiT9zorePAA0NeW9ncv77MCDjOj36pHDCXRs61IlfLHU+R1vR9L5wdOj+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmzYtwO6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmzYtwO6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1403E1F000E9;
	Wed, 15 Jul 2026 20:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784146709;
	bh=6Ubpidue3FInWGDSczhOjU4t/kQ+IccUQZOrRYBPZWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bmzYtwO6TJOPz6VAxZ2yDOZanqoaSskcJY+vBZxYwSZAMhTAnerXprIvion9zXaGn
	 WdvhQ5pukNo5QB1Ch0X59Cg1aEwxR8Ct4qKGFtt2Eyx4+YSFUTM8FGvTHYAdxZ0SVw
	 x4W6H/RHuBWanJFRInbIshxJbnNHh3GkxNGyKy0QbembEraBcBfIh5+qBHGpG8rHV7
	 vjUzDG7owOx2PFTyQ2EBgG4DVGKM2tHVf5xzV13l9loD4ttfV2yZJ7EdSrskKD/khY
	 obAH19wFY8dD2E9R3nV5ZgLOV+Dm8Zx+DNZ0njy/xLuoK5D+VhHFp8BBzscxFdA+Im
	 AQui98/ttKpfg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 15 Jul 2026 21:18:11 +0100
Subject: [PATCH 3/3] ASoC: tas2562: Fix default digital volume
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-asoc-tas2562-put-retval-v1-3-97bf467c924e@kernel.org>
References: <20260715-asoc-tas2562-put-retval-v1-0-97bf467c924e@kernel.org>
In-Reply-To: <20260715-asoc-tas2562-put-retval-v1-0-97bf467c924e@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>
Cc: Haidar Lee <haidar.lee@adlinktech.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZRWIcPjGXHC/LgYkFOepiJ/eK9S/BY/5+ULJ/6ePEGU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqV+sM3pgV+PoP6lUHw9C0CIzuCQuwgjtl6QPfE
 nAHqVmVGteJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalfrDAAKCRAk1otyXVSH
 0KvQB/44n6J+xWG+8ahJ4V1N/A1ss2PGy2KIxd3uDF24kYA2v7b/AtM7X/9//jYfOHSDMAUQZ7L
 fkccvg5Em4IVjIRt8koDbeU+ZkL9VBA5WaX4nM+I672PKMBJFb67FhA4wBfxJrz0U1UHu+A4lZz
 3a2TlenPzh3HzdfdPtMcxsqU3ZG6AR7NY52JsJqabLXhbXTbvH7ocVV02oRQi0+C0wRn5fqRv11
 A/owa1qeGsMqR7tqkGWRLpy2QEd0Y/Is2EzEUmeUHMMwi7CFkfSyY+CR4m8+nWIh5zjCvP0mt96
 vtKuJPdznLeh2jXahEmIDIdRrMgh9K6AHrAdV9F79gIOyRmR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The tas2562 digital volume is spread over four registers and is implemented
as lookups into a table so the driver stores the value for the userspace
control in the driver data. This defaults to 0 due to kzalloc() but the
register default is 0x40400000 which maps onto something a bit over the
largest value defined in the lookup table. While it's not an exact match
update the default to the largest value, avoiding user surprise due to a
sudden change on first write.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2562.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 9b863b000470..5fdbfec8ce3f 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -738,6 +738,8 @@ static int tas2562_probe(struct i2c_client *client)
 	data->client = client;
 	data->dev = &client->dev;
 	data->model_id = (uintptr_t)i2c_get_match_data(client);
+	/* Register default is 0x40400000, this is closest */
+	data->volume_lvl = (ARRAY_SIZE(float_vol_db_lookup) - 1) * 2;
 
 	tas2562_parse_dt(data);
 

-- 
2.47.3

