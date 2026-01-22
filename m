Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FE435B64D
	for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 15:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097329; cv=none; b=qXsjcDjaCcDy4PMD7hPI5tocBdnFiP2ebZSFPCnTUTG7Hvz5B1AMzOKUnRxbUcxfeaeHs3MIYTUuogcqukiVhkRGzvgO3LTP9cJ1ygEWszLdqWQ5wgCwG2neWFF5JBBXrEna8CQXb3Tq15IVEXFT8HLnTqaGV7Ybk1UVxTgucdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097329; c=relaxed/simple;
	bh=pITSoNE3VQ33XxIaYm2AgBt4ZThPk06LRfJuwhvwh/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMUkN8gIP0wmhdqTbSO52AFFbcSPGVGxwLNjWiRIqRjcXq7roxuTO51SpMf1yOo8oF0zNW+ekxs/xQs9Fjjx8CAoY2cFk4VVaXCKXRpq/gRy00bRDbJQcIZOefPkME0w6vO6xF+PifRRCBDEmgUp0DjHxWevgmAIUCcfareKqc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgcetXa7; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgcetXa7"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b7070acfdcso1150352eec.0
        for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 07:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769097319; x=1769702119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKtMTSVYxonSlbpUyIW/ic7Xfc0BNVbSgxoEnuNp57U=;
        b=PgcetXa7/UbUvlCl5xrRn2P0afO9xNMimnoaK2rZe/taRFWKcnM4Om6dTp1wKm+q0a
         mhk9xgYkHfw9G9MqzjoZgX2iCZ8YXCxifCLT2B4jEqLsEZXfBa1I8OA36YXOG4y3WIw6
         +7AQ4mN03yuctxeBDwra0W5ynr0Jxf2Cv4QCxOJ59PnnEw+RrXPTLPfbvMajA9n/G2vo
         Rg1I/DWIID4Z/vZBA+8DYHFb5Y0eZFKRx6Us9RcU9jobUO4nssxxdXX0ZdKWMKA4FtmC
         Cr2tMR+BddISbcQJxInHLFsxX6qGXkRefGcYXN8BxSbJ/lxtwbysfU8i5NWedE1PWv+l
         EPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097319; x=1769702119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SKtMTSVYxonSlbpUyIW/ic7Xfc0BNVbSgxoEnuNp57U=;
        b=qEjHVVpkY2OdSnafektDw+L3y6DxpVqDvbHA3nrIMjPtOC0Eez2MFc5l8YrQhGMWCc
         Slmu65k0bQzXZKxyw60KMy8JgSJ90dGNpjLFW3TWwe55Cnm6h6t9RUMIABvD2dNEO+az
         gyHWNjKEXkrtVzXflqc1wfaZRDn6JAP+d7YqQKhAuUBI0N73fPuJCDVBe2JtEQDrEVRp
         N0xxjGs/Cg/kLSkkYpqe1rxwT2RbFYMq8jKh3FUBOhWsJBTG8cSuOIR4CCOz7wVQWsTT
         LbOdlz90evS0XvWwxUqdYYPn7wG3WHDTYpuns/dxW7lh9/odPukX5Ppo8uMbORMrk6Ds
         gWsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnQR64LE6GScEAkIyEpSFHQt03ZmuHY52wQsHiQ5xeiMtRr4XOjnVxWRCU+CkWHZAZm45cU+jjKwDciw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVxWnSLZxtcVJ8r/nCQZGsyqTeM45LkGjzhx3RYROt4rF1iDdX
	R9vRGcp7pwB2Bh0Sjd+PQ+8XQ0coQ4qJIKwgagT5oIIXe8UwFegBuARk
X-Gm-Gg: AZuq6aKdUpUuJEmHx4I9MdbHgDuUE2A9x70HEC96a4xjD64WoAQQw9FwBp6g2b+yy2K
	AVlSCIN35WdCxWFJ1GCJ8CG7in1nydntevkZWm4aBpf2m2qtxWJawJLWczO9vSaaBbF7GSvn8J5
	+BI4QhfAfdium1G//pfwOF7CwMXS5Fkh0jj5LzqVYrTs6WPmVj76QY0BJJFrOON5TNVHFO9zM9U
	nIbpjOEzNIPi3+lL/as3dJ7DmdaVfhQYsnwjpVKP5lDJ4MuHs87/uoubR1ySYCJdX9BSsS9xXBc
	1s+rWyRWhBeiKxvqSF35Ems5goNzZXDmDfoEe9IfiHYr77yCNbRlyNueadtaBP9Lf8ODIx5Brp+
	7/1Ba88JMd8tfr4RI/larAoqsPNjFxTz2Mv31d8IccJqL6df8Iv03QQkW8FU88PW5mALXYkmfra
	ADDgQeM7luMQwh+HZQMx4yjUhbJTRbXErzKPDYv2W5zQCGPQnHzLqf
X-Received: by 2002:a05:7300:1908:b0:2ae:5bb5:5732 with SMTP id 5a478bee46e88-2b6b4e97901mr13128772eec.29.1769097318588;
        Thu, 22 Jan 2026 07:55:18 -0800 (PST)
Received: from gongqi-WUJIE-Series.. ([38.90.16.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm28935599eec.32.2026.01.22.07.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:55:18 -0800 (PST)
From: gongqi <550230171hxy@gmail.com>
To: rafael@kernel.org,
	dmitry.torokhov@gmail.com,
	Shyam-sundar.S-k@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-acpi@vger.kernel.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	550230171hxy@gmail.com
Subject: [PATCH v2 2/4] Input: i8042: Add quirks for MECHREVO Wujie 15X Pro
Date: Thu, 22 Jan 2026 23:54:59 +0800
Message-ID: <20260122155501.376199-3-550230171hxy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122155501.376199-1-550230171hxy@gmail.com>
References: <20260122155501.376199-1-550230171hxy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MECHREVO Wujie 15X Pro requires several i8042 quirks to function
correctly. Specifically, NOMUX, RESET_ALWAYS, NOLOOP, and NOPNP are
needed to ensure the keyboard and touchpad work reliably.

Signed-off-by: gongqi <550230171hxy@gmail.com>
---
 drivers/input/serio/i8042-acpipnpio.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index 654771275ce87..4cd09560c5bfb 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -1176,6 +1176,13 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
 					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
+					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+	},
 	/*
 	 * A lot of modern Clevo barebones have touchpad and/or keyboard issues
 	 * after suspend fixable with the forcenorestore quirk.
-- 
2.43.0

