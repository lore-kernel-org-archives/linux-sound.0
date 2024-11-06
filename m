Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5FD1DF736
	for <linux-sound@vger.kernel.org>; Wed,  6 Nov 2024 08:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881212; cv=none; b=AkmiOmRb+EDoVlXweMKFJ5axaLVklEgHmRGF9ABpRGLs8aa1GOiaHJ4fMdq4K40qEhokuWRZKXU68fOY8Ibmf+g79teq0Lu53ZdOvhbGbrwSosVY9Q6qha2GSASCAQytsg+gKctcqLbwZpgA0ThfT8H89CoLUj/AqmjPJr0Xwfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881212; c=relaxed/simple;
	bh=QhxaHQhEQbSU4HAJMWAlhJ2b4bTmMo3I+DW+bAanSzw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=opXQbgOBLTb6ijBdhlZUP7eieCRLNGVELRX9h2pQhW0GjGvS6W5oSNQ0uim26zLHHqa5XkKIxnD6dAm1isSADi+YPSSkVUuKg0d+XDyUwVdVntyfTmV2CnV6jBJ1ix3PIBwZfD+kz5eq2xYVFGQ5QlFgbehlHxMJbTWFSr6DURo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TIh+w6Ts; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TIh+w6Ts"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9ec86a67feso70995466b.1
        for <linux-sound@vger.kernel.org>; Wed, 06 Nov 2024 00:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881208; x=1731486008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keyxaK/rf+1WXM1+Qgkj4yMP90XxmUdDhzWy2M4/zFY=;
        b=TIh+w6Ts9/QGIjkZVRMuvcYh6honGGH7AQCc2wHlBks7lL6Q7RUe+GFhDqhJ2Jpout
         CCmB2FJZnP4QPCDDLOowbK3AEWW6Xf5fA60/OYw8ABgcRLRUiRYBjc75T3Trk10EV6pQ
         7hQqtVyXYMyAK0CFfEeiWCTf5O09Ic/eoZ5SbDT75ufJ9Hu0abJuto1p0idx0NFlnehR
         JbrXb3rn53+o4JO2hmCacyad1jPQSs9TBryNbL+mpZroMOx7vmq6Wm02f5Jq4q03deLG
         x6vWjSoyrK6kriK6RgD7/rlhoPjQVJQTZEgu/4GXNlXtzSYZxSKKF35KZtgCMBgxs+lF
         HjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881208; x=1731486008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keyxaK/rf+1WXM1+Qgkj4yMP90XxmUdDhzWy2M4/zFY=;
        b=n0Ig28beCiGxfgGthJMYgYNV0LCjDuP2v8dUvnUYYpI4JZdpPk3BP3267dkGjTtF+2
         JCZvsaxw6zPTgXJGCZwPYAkOmx07+Nql17CmB9Slso92fwQRXQ1nsyBgydi3xTHHjiJV
         +OshY5YL5s9okTOM2y5Qf6xCa+Ux2JZfqZ8abFJCqw3lxUnB6dcU8YfJ+3gFW8SXZ7nd
         zbZ2QxhReOLIl+rXngH/iPy4wz5Iim7MtC992AqDyDguuAIexbTVPGlEKniC51tuPweX
         T8S/Ef2Wg1V5G2nqW7GqUVJmyZEtdgcQpG7a5cZPCm2XybcqEbNwjylJm//VQWiZqddJ
         5taA==
X-Forwarded-Encrypted: i=1; AJvYcCUX4doE43I7+rRoQcdOUWibpapnvwoqKhuPqizm3cTzxwyGM8gPEVp9Y0FZudbJYnB6ezA4HFlB9E3QLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjq5JhajKRs+1FZ6b6+XvfJ0J5Vd6IWIQwDVav7JPPK1OibRR+
	vDG61DeDGakGyY9lDKWQBfPRVlo2IbMnlz97nqiAKyBCnmPsUPkoPzrZ+L0TIkE=
X-Google-Smtp-Source: AGHT+IEGdOR7nmhmm5rVDWL/VF0T9Y8wlc2teyYuu+R9m98yrznQ5wa6C0FQenz3Cgm3gZGz4QX/YQ==
X-Received: by 2002:a17:906:f597:b0:a99:ebcc:bfbe with SMTP id a640c23a62f3a-a9de5d992f1mr3807862066b.27.1730881208017;
        Wed, 06 Nov 2024 00:20:08 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:20:07 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 24/31] ASoC: da7213: Add suspend to RAM support
Date: Wed,  6 Nov 2024 10:18:19 +0200
Message-Id: <20241106081826.1211088-25-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add suspend to RAM support. This uses the already available runtime PM
support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/codecs/da7213.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 4298ca77fa30..01c78f8032c4 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -2235,6 +2235,7 @@ static int __maybe_unused da7213_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops da7213_pm = {
 	SET_RUNTIME_PM_OPS(da7213_runtime_suspend, da7213_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static const struct i2c_device_id da7213_i2c_id[] = {
-- 
2.39.2

