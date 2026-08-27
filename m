Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0277836B92B
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 23:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872919; cv=none; b=MbSJBNgtLGxtZQE7ENAGT2nO2OWigeeL+RFGhQ2lbgaoJ4O0t6HFbycdzzqGoP6NbdSWdEmNdsAsz8vZEgIYvOnmv17aQTi+l1f3uHsOz3oEuy2Xfh+rIeUMUAuPEoQx5kMx7qYl464nAb/vSiFmFSTEM5BcAE2VhBO7+JM9iQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872919; c=relaxed/simple;
	bh=ePzkJoNpPalxhOCXt5PVJAtsXVveyLh3mOZy7XB8YIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JuwXTQl6QN92LN+DcuckKzBSCzNvlEmAGENA3xn6/VobtEdAt+rVfB3yBPxcUU+WussG3q9ZQomS5AgKToxW3njPJ5DWg9iCsJMEBbdxVwqXrzCvAOkN6W8PxQhw0rIN9UY8KidnbBuxZ2ySKbWIMCM8MR1BWEXrpGoCKwe0+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npcxS452; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npcxS452"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4b28df1f600so448784b6e.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 16:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872916; x=1788477716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q6j+81W5sTdSzj/6qIi3uJWGbH2J1mlEvsG2WkACG8I=;
        b=npcxS452B5JRjqgAxq6RBdGnfPKIrfGVkgMZgrz2zOj8YsyLjT88zY1pb74w2NXVDH
         Unw9wLCX+w+k2SNCVJj84AtADols0TirCROJUNNK/fRgFBysbEoqaZ/doMYubsAEWfSh
         pZVLeK3lCYr2vAeYxCATWdYyV2kFECO5uDZ2ciX8iyWxaYHnh+i+VRU0aZPP3MwGrQOJ
         6XiKvou4iFa/WRlhrtqIQpJKt9WEIjdBtNfqG1kdlmAOeqzGRJchHurPFFq5USoYUiM/
         17VG/jHX/YyhA+rcSflb6sg2Zm5RQhk44F3xm9gG+e1pKq17bY1w29fPN0qCkYA8x1Mp
         C0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872916; x=1788477716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q6j+81W5sTdSzj/6qIi3uJWGbH2J1mlEvsG2WkACG8I=;
        b=AztxyklggIv70zgN9kXDiOo9KwIhnPrQd6t5P5nDdtXU12jciwQUJzq+yRBLDN8dWN
         46PU2jUvwH2rO/WIEU4n2ibPkVJgSSAw1lJsyvVyOzRORdUdpSH9K4Ry3t1e5gs8BTgd
         77TzKT0CPKG5Gye12nR9EClv0hS9aMw8lcXTnmB6WQ5BQIJ6BBGh7w70PTVZ4VmP9n8W
         2Tj4AxBSavoNafC3lYv5adH9/vPXFlaf8yFnH5W/WpxV9S1zW6FCtXAqSUUEIUAm/gHI
         vNDZHM84LRz/DXJDbPzu8kurL+jtIGHqnLtk8QYQa1WUCyouSfONhoCw52kIbJJzcplv
         X1/A==
X-Forwarded-Encrypted: i=1; AHgh+RpJKtagkwOoq/qbX+vL5h39EkPhTBJJtQ9rNj/Nk4LO9g7Qq0FXbZv8r4hR/EwTrXqLXgLYR14jc5T23g==@vger.kernel.org
X-Gm-Message-State: AFuF++lIfWUwQI1npNulFvMqFafa3+e+i0ucGMBoEo8EJA545VdOWliu
	47ozTzrDRr4BrWrJ8Qj8p4pG78WPO2aQ2rg4u53gnJEcMxYhCNv2G36Q
X-Gm-Gg: AR+sD13FawuVqI/e4zoJ34Bh3kXGM9ozqziF/G0K2zKJZ/GFdhq4n6rNq83wfUKHu5+
	tSB457U/x3bnU2mzbcFvSOXY07Rpt9mDhzccctKsh1nsEvOmvyehyJqbADcwcRt1CPf53Ytehvl
	5Uh3CTK28/McdfbALpXPsnlfpjEhrHgWV1htLNeL+Ct8cPRf4MtZ9zS/My9LPynjnEcQOgSz692
	agBRP8cCI4PSXwJXzOOqqUSaV9B64Y/XqYrCSLHfIhjRRdNGlq5/90rfBliYfVD/uqqdpQ5UcXj
	BIw8rrXD7+OFLM/l5cUMcoYS7IVih6l3aqSJUFd1WkktdLmVbxGVgmNLbzJ/z25chQc6izp73Bs
	7n7FvbIhRvl+9oibqZmPvm4kVePryO8wTXisvoPJYwOY4m6JkeCd8PydOA9wlkPWk9rJ8Ohby2/
	28o/niwoYT5uKopZAsoge7Zr6eOG6cLDyxSm7NKxrq+oK4K8fpNgpuy5wT7Ui31/CaQFxxmsHtA
	MlESg==
X-Received: by 2002:a05:6808:190f:b0:4b3:7efc:e970 with SMTP id 5614622812f47-4b3980115e8mr2982157b6e.5.1787872915662;
        Thu, 27 Aug 2026 16:21:55 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b38fbfe089sm1589553b6e.14.2026.08.27.16.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:21:55 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Asahi Lina <lina@asahilina.net>,
	Chris J Arges <chris.j.arges@canonical.com>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Detlef Urban <onkel@paraair.de>,
	Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>,
	fenugrec <fenugrec@mail.com>,
	Frederic Popp <frederic.l.popp@t-online.de>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Shipei Qu <qu@darknavy.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 3/6] ALSA: usb-audio: Add PM guard to Scarlett meter reads
Date: Thu, 27 Aug 2026 18:21:40 -0500
Message-ID: <20260827232143.149197-4-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827232143.149197-1-mrwillporter@gmail.com>
References: <20260824230302.27965-1-mrwillporter@gmail.com>
 <20260827232143.149197-1-mrwillporter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Scarlett Gen 1 meter callback reads the device without preventing
runtime suspend or disconnect. The transfer can fail when userspace
polls the volatile control after the device suspends.

Hold snd_usb_lock across the meter request. This matches the guarded
Forte and common mixer control paths in this file.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_scarlett.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/mixer_scarlett.c b/sound/usb/mixer_scarlett.c
index 673eb8d8724d..369968565c19 100644
--- a/sound/usb/mixer_scarlett.c
+++ b/sound/usb/mixer_scarlett.c
@@ -707,6 +707,10 @@ static int scarlett_ctl_meter_get(struct snd_kcontrol *kctl,
 	int idx = snd_usb_ctrl_intf(elem->head.mixer->hostif) | (elem->head.id << 8);
 	int err;
 
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	err = snd_usb_ctl_msg(chip->dev,
 				usb_rcvctrlpipe(chip->dev, 0),
 				UAC2_CS_MEM,
-- 
2.47.3

