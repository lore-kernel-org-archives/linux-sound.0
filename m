Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771AF3624B7
	for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787484764; cv=none; b=m2cBpYvL2exy+qUIdKKu+bBzXmdvVeJCcZZOwhkT5KuQfhjg462QkmXmTcZsjPZ0pnx6BrQo1zWRZoyUWvUiWZLnnoHAioyRYovZWLNExscobJMJTGZWBKTG0nMu/zVn5n2i2JEF+At3t4+roWdHSHYe5Ng+9yOVuFbTT+D3oWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787484764; c=relaxed/simple;
	bh=e1JbAgAIv1KILai0LjoLUtS3IhYUi4tzMR1FIomIUxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QmXoafxvHRIp2iKdxI0uLBRPRi9H2T7ipePhqyjG03sA0GjPC17DlvTWLmlqXmb/CO7cjm4d8iumAe/vVn4j7vzvK4Vq/guxiPQZPOSai5VmKgadc5pVm6iM07JvyACbuOBEmFWT//iIEdRsuWOgPtLgBnFGru0YziK8NZ9EeKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qmq3wsSE; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qmq3wsSE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381b831d535so3518280a91.0
        for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 04:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787484763; x=1788089563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2F+QmlCd8FClck9x1jenufP4MPbBNePZZ/j6fYEsaw=;
        b=qmq3wsSExX02AuSKnnkUW4KWEk3LXj/lf91Dfy2L5eYsZJZoUmYnAEA+XqznMo1Xz9
         10yupI8PK77odMnJu+KGsp4X7ofrTLqAQ2VdnWBGR5GBPQRiFpuWWzSVn3Alrl43RW1Y
         SL+P29nBOGyFwQGlgoU49tvp1Gj07WUvOinUmb7ZhNJdcMhExY4+zqKmeAH/Ch7AsPYE
         Bajlw76yySozA9XBTBSMrN2UAi52ctrbWj9J7l9FzlOMmMNuS8KIjIZ8d+6L2Yo4yXH4
         HkHkS+4JnXV63JxMQEjcWv+rGtcrWrUc7sOBOUQyAZRJC0ZPVozUUVejZd3/PHlrN2Sk
         YHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787484763; x=1788089563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2F+QmlCd8FClck9x1jenufP4MPbBNePZZ/j6fYEsaw=;
        b=ex2leLPEhh76Rvz8XQNXyn3AZ7Wai0ZyrQfh0LAC631H2ajEc9mgO/rgR+8q8UArYH
         BLXC60gzUguwk9lmn4u0LpOC6NYQlpwl1YfBPhiEH2Vr97SBj03orTf97Epj+E0EKCio
         SjW8hBGrUQwMTkW/eRGEqVqLC2bdNjOKONijruEZJly52E3E68CKS4/74L7v5TD+HJtN
         5b6sv0nVSsxfi8HC7rWTP7I1lijSwsUm8V5qcxYUGrGg331E1BdbckUKKf7gN8EODVuZ
         pj+jajhxhJe7uWpBg2BYag7pP9v5Z6greuZvinIUAGAOKaJZLJfZVLiYIrSEgiUns3SL
         Mc3w==
X-Forwarded-Encrypted: i=1; AHgh+RoGuwYfab08g6iYNCykaFDmXn2R8hwGsPHKsiJow2T8dxikiXwiTbyuL6a2Tp4pBJ9wZEFHSaXgis7U/A==@vger.kernel.org
X-Gm-Message-State: AFuF++kT65ME4f0N9Dem2TOlBxGTMsA0bx385jsBnEqAvnseFFFIP6MK
	zijGtMBEgtbHHcISgPv+IKpIfv+PZUiIGT+X0CzLLhOpdo9YgQxMx7BI
X-Gm-Gg: AR+sD107yuMZJjELnQ4TUopwSyi+wMCZeres/s8w39fEkJESthQkQ+EFf0ABZJMBrE7
	i1whGqH9WqWI2wztrNMRJ4TVWNhq2YOPOxNSQMGxskvau5LfNB4gx9SuG1Vg2kjCFnx1h++Q+r0
	HJCqZnHcNnm+Gfyr8tHEz/9AgOYOA81BvtOpyDkDCli3NlsT0DxNvHtNELIXZXdJPdbPTLJ4Zqj
	v/ANhpXcIG1cEd2YSa/2WLyK4lF3b4rQrIK/Ax9WKaa9nbd7K+AY3NUUNC22SMvJrt0r3JcKCR8
	4jQCp48ZuTPqI8hVS9MgXtExuSudvrGAvHOIGphwXvI6mFEQKQbRZbiEwZE5NgPenEHI7McwX4j
	c7H04Jva2FgZ2xtaIznbsBlUiVtQd6IqG97cNgRN6oqoGqNjzo5YFPlM2daISE2e3rs8fT2x07q
	b2mTjhAmGzcF7GuoVMGDX16bhbulu93ZY+H7Gry8jJoVBTbZI/dkEF8gs10Sf/YP75tL+B8aYL1
	ZMxp4nJzX4/YQ2/Ps0CnsN4QkGod3k447MRslSn/N2ZcOVg6u/ahWMcwlE=
X-Received: by 2002:a17:90b:5347:b0:395:a7eb:a4d8 with SMTP id 98e67ed59e1d1-395c3a4bd22mr36289150a91.14.1787484762790;
        Sun, 23 Aug 2026 04:32:42 -0700 (PDT)
Received: from cjtlabs ([2001:4451:42d6:af00:6727:e52a:c6fd:e142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860c6989sm15191631c88.2.2026.08.23.04.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:32:42 -0700 (PDT)
From: Christopher Tolang <christophertolang@gmail.com>
To: Vijendar.Mukunda@amd.com,
	broonie@kernel.org
Cc: venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christopher Tolang <christophertolang@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI entry for MSI Thin A15 B7UC
Date: Sun, 23 Aug 2026 19:32:21 +0800
Message-ID: <20260823113221.19744-1-christophertolang@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This model requires an additional detection quirk to enable the internal
microphone.

Fixes: fa991481b8b2 ("ASoC: amd: add YC machine driver using dmic")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI Codex
Signed-off-by: Christopher Tolang <christophertolang@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 3f852393f..3e72618f0 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -843,6 +843,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Thin A15 B7VE"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Thin A15 B7UC"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {

base-commit: 2709dd5ae32f0828f386327c76bba9f39f63a1c6
-- 
2.53.0

