Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF5929BDA0
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 09:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149232; cv=none; b=HymzRUaiYWD4TEwXTbQBgS61hpLddlzkpOBS3WE/PfIdlskArmQCT8f7FhxYZS/ZaUgWvqXOWiY0mQIFFywX3fLqd4kfV0wiq74dWdNG4GyvmjHu60gp+hQomx/PyNrKxJsjBz4CkblGHxKXeyGuafOnkW2A+nvP2XjpU5Z+Cjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149232; c=relaxed/simple;
	bh=KP3L0KVmJFiyZ9FddEJIpgeeUx/zlqFOxmjzR7zUafY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQw0WYqPLO+WeuUDk5EAeYemd0VBp0hF4qIFg0PViu8sA/QvYWZ2RR93pcCT7+sxgZMA/GQNX5VSoqE9OrCMvulOEXoK/r0rI9vMtqs9oy8nXWiLGmsqlfvTzPC8uLxZ/P9botyEM7GhGVFV2S4hmpGBgtuZJLHL2RFBJr7cIC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=CW+xs7xd; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="CW+xs7xd"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2F20B36C85;
	Wed, 26 Nov 2025 10:18:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2F20B36C85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1764148705; bh=FV0w8kc4mSmmyjqmGriSA80491vCNceJHjQLLwdM6L4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CW+xs7xd89FElQVrTyAu12M4nUxap2BJK64gHqYV3QyTrt7/Xti7s+Ow4nZDhnjIW
	 jZ83mTbUdNSj0EIef4yMhQzJD44yJ39lfvgTABW7xghqeD2htquJtsFHlC4jjqe0L/
	 GVBA1smbxJAY0v1xJiYF3DdEsQTppqBC4s7ntqZ0=
Received: from p1gen7.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 26 Nov 2025 10:18:22 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: Linux Sound ML <linux-sound@vger.kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/2] ASoC: nau8325: use simple i2c probe function
Date: Wed, 26 Nov 2025 10:16:34 +0100
Message-ID: <20251126091759.2490019-2-perex@perex.cz>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126091759.2490019-1-perex@perex.cz>
References: <20251126091759.2490019-1-perex@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i2c probe functions here don't use the id information provided in
their second argument, so the single-parameter i2c probe function
("probe_new") can be used instead.

This avoids scanning the identifier tables during probes.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/codecs/nau8325.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 2266f320a8f2..5b3115b0a7e5 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -829,8 +829,7 @@ static int nau8325_read_device_properties(struct device *dev,
 	return 0;
 }
 
-static int nau8325_i2c_probe(struct i2c_client *i2c,
-			     const struct i2c_device_id *id)
+static int nau8325_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
 	struct nau8325 *nau8325 = dev_get_platdata(dev);
-- 
2.51.1

