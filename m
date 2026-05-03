Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35413B2FFD
	for <linux-sound@vger.kernel.org>; Sun,  3 May 2026 12:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777811039; cv=none; b=Rj8KGf7AmsCrI/X/flbZbKup6FF9GJOnU00PtguzxqHQlo9tB1bfXZSBTVgwm7E71LdtugIX/aO073EbnVvPUWJgAXUJMbM+xYXQVJv0+8cjjxKKTGtBj2r785UE86sNTo1Mw+v+ddnUBZCqjRQiP0q6IwuJ3TjMkMTtmV1SWWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777811039; c=relaxed/simple;
	bh=0BxDQKg9U+Ox+mI7tseZohlkvmKXx+ARG+YotcC1/OY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YicZfMOjeHx8r1CqHTRXwyG6/Lx3G5RlbY6UsLhVqhP1qk/ODgEuFZ0n1ipSWgYO2tRekeysKiUl+sLYr3rgFTJHEpcsNJL5OofRsx3Ng7KrDPlJOT9T47dNMfmJeVjjyy+Y5YAP6B2XksJrmC8QfH5YxnVV2nUtFv+0j/GUy4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MK66963c; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MK66963c"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8025500cc7so311537a12.1
        for <linux-sound@vger.kernel.org>; Sun, 03 May 2026 05:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777811037; x=1778415837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARXgZHWlxADKCu4jNBhWPeDkQ/ONx5QPdnTv+mQK58o=;
        b=MK66963cYv9oVNoBVStbvj6MwoWZbh6DIAjBAZQ7dqjkMe/CighFVnj2jenbJcZ5Mq
         CmgJqnsrZkAJuP0uanBb2lbDvb8rL5WiBUwnPcDBfP+9Onel3SNMQGvjbCGyiEwkjSJK
         nPKdlXv/Fwnw5KbKKmqbR5xijAoIX7DbJ7qbjhz4tvGUzXAA6b9HjUhM9c+ejLFN5STV
         ehsKbHzZ+cbE1FdwO+QCfRPmJ4dbIYQUMR7+c973nC8dzPeVuBQgI34JRp51zzJA2R82
         5k/9ySXWmF1BnMS5a9CZj6bPQ4Lg9erOxxiEomX0g1yEfQJu9ILRY2h2NMPQs928tss/
         Ci6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777811037; x=1778415837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ARXgZHWlxADKCu4jNBhWPeDkQ/ONx5QPdnTv+mQK58o=;
        b=Em8E7s1255ocLE31YBWFaPfoJv2bAWOhPmnLxrhTS8Q3aG71XzDa5SLvbygr04zhBF
         js4pTlUokAHM6ilKx/+9zxTh4K4C48I+3ynS0qXJbhe4V6TR4wrDgyNIFq0cmBk3sKm3
         T8lfi4CUU0TykieydiGiQxmxqExFhtsZ71lzl729UNvzXWauttjwLPDE4H/Lv4IbIPiq
         cWSHDT3KcmEz62JgOhwZS0IvAZwLYLU2Xf1OswQ9iu5F7N9xpK+cAiVKP66hQ3s8vhln
         OUE/SjW4/km1BaNLyFewOXX/yzADxp8Yw5VQ83cXEM/t7iSj8LNfzkQBBZdWt3sXxz9m
         bhLA==
X-Gm-Message-State: AOJu0YzTn8n00McddSkv+dyTktsk4rtOiGr48HsuqZUJSmqrjApPppQv
	syWNyz0jMpzsO7k6k03t7BGPN48vwgEcHy5hROZHw1+kg6DaBsuBccb8
X-Gm-Gg: AeBDievv6cRjwdgwvXATkAqq7ZbRhQzEPVJQA/Ht44f0HPxVqKqEKwyttB4nELXz/9h
	IT2Q97dZxbovgTb9uVlLuf7U3YyHH7XsqeBklB8SpUHoNCyisSLev5PGO1tY/IR77wwOnRyNPqQ
	0ZLRUZXeiRs3HEPY8pmiLCqM2IHnhTLpugIVCM0k9IEznaes15oSmYgHc7rcJjZXUFmxMbItBD1
	a5bSSKFQ1ovdaYNm3CcrDFfwqOm20cgVM2NjJs8ZxZW4SqekWPNXBpSIrMP5HpC6TGO89iRybj3
	TXmWoxj1sUoA4UeD7V9Qe2bWm6wuis5iZTZ410fsXZcTdJZQeVn/xjWf4KFB0fe7gfc5HBFBKMq
	J+lY9gOk+peDRve3uLdX+KT5IksurOhc2vFJ9j9/iZfscJEh2+bFYa0ghoib2zhw0oRT2iE+FFz
	7+9YwYeUTUqWWstjjeG1kqlTIQ5LrE0oaCFSDj3g7KS6ySZvKn25j0wjJUNX73cib3MqqGvhe8Y
	/urOWzRZhl+4023YrwdstYD3cvqgPExOIZNIjK8se9TGS9LuBU/hPB26+4j80YxZS35iRqJRNYo
	ZZrp7k6FZmw=
X-Received: by 2002:a05:6a20:1592:b0:3a2:f2b1:1ac with SMTP id adf61e73a8af0-3a7f1fb6640mr6397695637.44.1777811037064;
        Sun, 03 May 2026 05:23:57 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8023e6eabesm2098464a12.5.2026.05.03.05.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 05:23:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 03 May 2026 22:23:24 +1000
Subject: [PATCH v2 2/2] ASoC: tas2770: Deal with bogus initial temperature
 value
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-tas27xx-hwmon-fixes-v2-2-208e802be4ac@gmail.com>
References: <20260503-tas27xx-hwmon-fixes-v2-0-208e802be4ac@gmail.com>
In-Reply-To: <20260503-tas27xx-hwmon-fixes-v2-0-208e802be4ac@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Sen Wang <sen@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2271;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=0BxDQKg9U+Ox+mI7tseZohlkvmKXx+ARG+YotcC1/OY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnf7XybWJ6/zFyWH11c8ktp00q+UwwVs6bY+FntWO/Nu
 K/8Y+nLjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRvuc/wh/tFQU+ZZOTfvb+Vvi/hD/0vpn5p9tIqg3/dKYXuEj2LChn+WTxkujB
 nw7dza6TFn9lMNBV5YvMl9PVqL6anhvymXbtvMwMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2770 initialises the temperature readout registers to 0.
This value persists until the chip is fully powered up and
the ADC starts sampling. The ADC then persists the last sampled
temperature during software shutdown.

The ADC should therefore never return 0 in normal operating
conditions, so return -ENODATA and mark it as a fault condition
using HWMON_T_FAULT.

Fixes: ff73e2780169 ("ASoC: tas2770: expose die temp to hwmon")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 50501bcbe916..dbda9f327535 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -633,10 +633,27 @@ static int tas2770_read_die_temp(struct tas2770_priv *tas2770, long *result)
 	 * value read back from its registers will be the last value sampled
 	 * before entering software shutdown.
 	 */
+	if (reading == 0)
+		return -ENODATA;
+
 	*result = (reading - (93 * 16)) * 1000 / 16;
 	return 0;
 }
 
+static int tas2770_hwmon_is_fault(struct tas2770_priv *tas2770, long *result)
+{
+	int ret;
+	long temp;
+
+	ret = tas2770_read_die_temp(tas2770, &temp);
+	if (ret == -ENODATA) {
+		*result = true;
+		return 0;
+	}
+
+	return ret;
+}
+
 static umode_t tas2770_hwmon_is_visible(const void *data,
 					enum hwmon_sensor_types type, u32 attr,
 					int channel)
@@ -646,6 +663,7 @@ static umode_t tas2770_hwmon_is_visible(const void *data,
 
 	switch (attr) {
 	case hwmon_temp_input:
+	case hwmon_temp_fault:
 		return 0444;
 	default:
 		break;
@@ -665,6 +683,9 @@ static int tas2770_hwmon_read(struct device *dev,
 	case hwmon_temp_input:
 		ret = tas2770_read_die_temp(tas2770, val);
 		break;
+	case hwmon_temp_fault:
+		ret = tas2770_hwmon_is_fault(tas2770, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -674,7 +695,7 @@ static int tas2770_hwmon_read(struct device *dev,
 }
 
 static const struct hwmon_channel_info *const tas2770_hwmon_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_FAULT),
 	NULL
 };
 

-- 
2.54.0

