Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC50B200D9
	for <linux-sound@vger.kernel.org>; Sat, 30 Mar 2024 19:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711826844; cv=none; b=pE+k34J74RtBotkwyDUS9uc1TaJQb8JMustiWR9jOPrdhrkIj2/OSsJT0goxCiM2FE+Swd0pmjUotA2Wz9qj90vPwMik0Sg3bE5xqsoNg8wdyueX14RNaKzfiRTcD38uY2kFehZC7vaOUaeXqHC1yxu3qgTNEjNRDF5xDqTV9fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711826844; c=relaxed/simple;
	bh=7vXKpt5kMvjCw/Bc7RGx8qUv2326+xlY2fMwnqF4N4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tzxJmUanLyb93N9QOKwkGDqZ6llo863FGuOIlA2i6vWFnaHeTTTWCsxAC/1tPoW2cVLlLWWmt1s6DdIfNwjTZalQtcUbUyTGS72erLoBAN6YjkxAHws+cdDJKkJx8XogvRcSwQ0ENIqh5HW78igddUfu66MHicqDfmk43kZzCPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kW+QkP4A; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kW+QkP4A"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d4360ab3daso36179691fa.3
        for <linux-sound@vger.kernel.org>; Sat, 30 Mar 2024 12:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711826841; x=1712431641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=srlPnSviOUwCOp87gd3on0IVNQFTAHaOJjEVsmn3f5k=;
        b=kW+QkP4AjoV+xzhbTxUc/j7HHb5egqQz05D+k57ylhhW/9cMM41e1K6fKBZHuPEMgk
         JjmARIt0/W6aDbZlrWELiA4iLrtKOG+ANQ2tL4EPkEEUS/Af+9rPX1pFfSYmIcTgWbNM
         mRBaf+mlE7lR9ypSyH2ybQnidn+qomOEqycNL0GlDhj8fvDY88spBcwCCz6SroiIMoI5
         yVIEPT7bPNywI3EYQRXdx7bMXfCp/U0/FcOfj2hHTgtk0+QyytUvY5sm+agAQe0jQelm
         yCbJ3Cs62dfw+qlUqMRdiKUeOOcA8e5R1xnnPK2w8mNUEsx+FIf+f+DaCWOW4AjKytwN
         Zmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711826841; x=1712431641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srlPnSviOUwCOp87gd3on0IVNQFTAHaOJjEVsmn3f5k=;
        b=YOMltbRChu6Pr6W5GsPBtgX4IR3us3act8X5QoFkOl1UhkIVGqGOeQe8KG6K+byg9v
         H6JXhNuS0MDcXvYy3/52eXDj6myx4t3/tufsUn3V3fwqcYazREs4pc2R0xjvD615h8C4
         F+m4cjb5UeHMV12VuVNpnBCnWuoyF6Lre4n1yH7+82rLi3kwy/7G6tEDzpiQUtEqKAAk
         iQTF7jKpg4xGJTyN7saDVqgD40UbMtrZAvGrnWRfyplX7PK/5x2oIYOqD2VjlgTaqS9N
         bp6A3Z8dscLPGNwXq9wjPppu07fHPDmnHr+VqzKoH9mq9fcWgHkKWkwZvyOY67dlgG3n
         5QYQ==
X-Gm-Message-State: AOJu0YztXMGYwgUzcn7XKgthd5Q723Px7/zHMmQGPUKcrw6tUEltzrXY
	QjykkHBdkoeMWRkwyIsFPpKO21SWUx2L0cruZ6xBbaQofTKiu3W/p3d5f1Di
X-Google-Smtp-Source: AGHT+IF/CbJNRH218O+QLN5rib9IB1iSP+JihhK372QcrrexfYlvHq3qIJhgBtj3YdmRkBXk+f89WA==
X-Received: by 2002:a2e:9f14:0:b0:2d6:c5cd:144a with SMTP id u20-20020a2e9f14000000b002d6c5cd144amr3166051ljk.16.1711826840475;
        Sat, 30 Mar 2024 12:27:20 -0700 (PDT)
Received: from archlinux.. ([5.104.47.249])
        by smtp.gmail.com with ESMTPSA id h2-20020a2ea482000000b002d43dbab74esm955454lji.14.2024.03.30.12.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 12:27:20 -0700 (PDT)
From: Dendi777 <starrynightowl2@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Dendi777 <river.blaze@mail.ru>
Subject: [PATCH] Add support microphone from Acer Aspire 315-24p
Date: Sat, 30 Mar 2024 22:27:17 +0300
Message-ID: <20240330192717.2033-1-starrynightowl2@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dendi777 <river.blaze@mail.ru>

---
 sound/soc/amd/yc/acp6x-mach.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 69c68d8e7..332a68cde 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -430,6 +430,14 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "MRID6"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "MDC"),
+			DMI_MATCH(DMI_BOARD_NAME, "Herbag_MDU"),
+		}
+	},
+
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.44.0

