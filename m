Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B15121254B
	for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 00:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770943397; cv=none; b=T/hauBV2XHZPv+445bIlXRhnATGvzvnMNxOqjapSU+85toZfygkfNSc9GdLtklIdkMZnzGk7Cecat1/eYct6p2JYJLYHG8Mi9pdmaakRIHpaVjXnuoQrKbJHaTgXOa9KehhpNMUi8Cr6lo4Ot2IAC6vDMFxrMei8ZKR+4cRjN6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770943397; c=relaxed/simple;
	bh=M7KZCK98ow0KPWs+XO9UwmlYlB1lKcgTJc20cOATSL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvOXQG01nPDdIL2RU0zzEXZ+Ayp1nfbeR5hhdlUaOmO4EnzOwp5ETBK9B8F8ajUekT5VFT09q6sO/SklHagqLg6YyKJK5vcaHkLWiJVsdpA5lq+ZdHqgw+KuIZPzN8XDkB+WTxspYjFKLUQUoZcK2zSm4IImCM5ASHXy0wgUMQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRcwyJ8u; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRcwyJ8u"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35480b0827bso221006a91.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 16:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770943396; x=1771548196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AN0mP+ZmQTR3ELzZZTOreC2XTtK2a0bz6wEq+iw7zE=;
        b=DRcwyJ8ufshZj3TRi43RLfb3/KWkQw1mxfo192M4IgsuBzRRYOfVE/MKFzftA6DY9h
         WcVfSTIzdB7YYzxw8AjETH4zmapGxCFRc6/qvXwCD0VcBSROAEVLX75OmGh1OANYhef6
         wwVNohXRW/NDRl/EmzWpK3PixID9/LWZExtPZXiY1hIzi2jGVpf8bPJ7Vx7nqEH9tsBf
         DlBMfEu52DP0ANO2DCKF2JYWlQzvHcFT3RW4E8IjY8inmJ0IBdunNCBh1fTqC/qvbI75
         wOct8dycSye0UIVQGYDw6Fjfwwyhilyqc01ODF0nuqbS0fx6dzqTE/Qp5GaxONHchock
         vGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770943396; x=1771548196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0AN0mP+ZmQTR3ELzZZTOreC2XTtK2a0bz6wEq+iw7zE=;
        b=KKL2Xtn+TtpFi3mH2pNYr6jHMlxKLzxYS+YMNAyDm6LwvNZix1DpXEkFRmXedMitLe
         liusWTLCOAWrQd/2bfK0tAsMp3QilUYXXBZbTEZEgT+GiycXjBbZ+NrdPD6eG3vIiUr6
         qPWOGN+kn2w1mBUH2S9+y1HDA/9YES0odgJk3b7wswqR7M8TBUtrwgS+eo53fbBaC7NE
         /5fk+EeeA/HYUkBiDycIfsAYvUYicdIsUN+D1WhP0EzK/sliEwu6cJ6zqRTe8L34k8jN
         Ot6+9yC1MEWVaAkxH1/pfTpbENQl1ArsEx8FAn7Z5pp42/ZnCS5nsjqSAS0wYTkYxWFJ
         V4Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVaODuLboZN9ZHT5r3ty1RMOlEBub5qRvdyNQFDctpr5bCDtN8A5pPk/eZ2EMjY0OYKkp6UO6g9rrvwXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzAmTEtpKyaoa86MZ3TRpRE6rIzXrBWyUMGM97PINeOTAh+zYE
	w0Y2c9cEjgH8ov6F8vxrD+xhIFKwkpfDh8leM0pNNHASBgnfRS0gOcu1
X-Gm-Gg: AZuq6aLN9oasvBgUfHQk/p8Oss5G6fg0WhtWJuJ9sdSyD7d/Y36uMymcRUHsGdqd4y5
	3thIBhtCJ0xCyhaJusJMqBQlgw/sY+ERtnJ2FEJ6sUM65xlo0yatd0/WWoZYNmkVQQNysVElVHv
	D5pXXT3AF4S6ChH78OCQ3kTwRTxrGEMDnMQc/gK/RVvEvPIW88ny3Fu9xIUUWDxZKPzoxu0acLe
	XtmLd9YqEHyYgVAzT3PQlrjRv5Xt0h2G8v+p+5yPACBT7GY7qh9SfR9ZITsKjzmWdM6Wd5x7QL/
	CQ5r5lae6116h3ejS6p5vAHpGPQ07jM98nDu79ODLfhVS1tLDmVMFVDV6qVCRnenUfzN7YbvPUL
	/3V7ULljUSGgUtJOpD5yAjFjoQO3LmF/OYnnQFN7/nUj6qP/r8VFAKy6CDae6HKVk2nZmXWOc6w
	==
X-Received: by 2002:a17:90a:e710:b0:34f:5039:5ac7 with SMTP id 98e67ed59e1d1-356ab049be0mr179836a91.6.1770943395676;
        Thu, 12 Feb 2026 16:43:15 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69ba2sm515751b3a.38.2026.02.12.16.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 16:43:15 -0800 (PST)
From: Mingyou Chen <qby140326@gmail.com>
To: vijendar.mukunda@amd.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mario.limonciello@amd.com,
	venkataprasad.potturu@amd.com,
	Sunil-kumar.Dommati@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v5 3/3] ASoC: Add quirk for Lecoo Bellator N176
Date: Fri, 13 Feb 2026 08:42:46 +0800
Message-ID: <20260213004246.16615-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260213004246.16615-1-qby140326@gmail.com>
References: <20260213004246.16615-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lecoo Bellator N176 requires a specific quirk to enable the DMIC
support.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 0294177acc66..de49c812124a 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -45,6 +45,13 @@ static struct snd_soc_card acp6x_card = {
 };
 
 static const struct dmi_system_id yc_acp_quirk_table[] = {
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Lecoo"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Bellator N176"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.51.2

