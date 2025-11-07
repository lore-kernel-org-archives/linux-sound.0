Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B4F79DA
	for <linux-sound@vger.kernel.org>; Fri,  7 Nov 2025 17:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762535600; cv=none; b=u+ejf/+G0y33JSA1wlT72E6iDjtqeIeYfKunpE/xEV/LLGKlMETgq5OybuQ3Jnsv+pxcT9yvxQ6Ll9qTpbfrrXU1ltGqazO+bMR6xQQCRRorVYt0epbqegXJ2LmdJqB5L2vsVwMzqUf2PcCTF/CFFb4ll479yX60taAN7O5sghI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762535600; c=relaxed/simple;
	bh=+foSY7njvUrejdgPjbH4fKfq+HP7j/XFMPQuEafrKZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YxJSRL6D/2E8VUIjpMdGS0ev0sjOLZLsy+iWEJDz0YaGRSHuHqo3te6e+OC9mXTu2o9lDJhA7po/ibMemvnO9CAFPI4jxojg+JsVVclWchkyn81Vfhvkn7OAUGMcA14yNgPmuKSI/QFPnOVqxbXeDgNAvPO95ne4Jl2P1JWyfPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KS1FkbWd; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KS1FkbWd"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b0c3451272so1348343b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 07 Nov 2025 09:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762535598; x=1763140398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vMmbEyqyLZZJZwZ+03cq771i48PrvXqZEJWareDoknY=;
        b=KS1FkbWdZRbr9mbsisq1bdAmYCWet7PQOYgEKyB5OcjU7S2gNxFtH6ILguc0LD8fzI
         fRMRgePNNTfEnaXbJVqGMzh3fGdg/K7va2ZYNa4xeqq20r3C43Nln/oDk1FmhItjA3Xf
         bt1CoBAxXwE+vPF7m7uFJVoPPsaej4wDekF0MHHAgefg5D6Mz+KyPgExJXy2dxjWR4vt
         fPCQCx3lWIdnhEhADFV8hJr59vWO+3YgPJN3XAiVKq6hn1vBcJvuIFM1m8WRZ5teDYo7
         8QD6P3yXi//3zTVBQqxynvzVNnshZx+rz8pMCvstDMkKvccut1XJZ1St+wqsAvIeQgNu
         Xbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762535598; x=1763140398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMmbEyqyLZZJZwZ+03cq771i48PrvXqZEJWareDoknY=;
        b=egsXuERbD8kZl7DpdGKpJvFIMZ+1oknGqvRBCp/F/cs0bR4ERCH9017S+XHG6nJs1v
         fCL0tNQRhs0OmQgcMrU1hz6WbaeqeBZUKPesJ/8l1sI0KGNrL3zWZJqTQ7I/FR6G2OB0
         nZqXXx+7qDjkryWZAexCbM4OFEhrFJgP0kDXAMAl2+ucd6L8UmiUnQUGeC9nfUpIEMN3
         6NqHM6XEdpUEo2zJJ1NzDiew2xI3pDOuYm6jQmDNYx98p7NKw+OZJs2mempTZtek5laL
         ka4EscWgB/2LEs94x0n0jDWdFqijKRclGm43YOE+p6A24k061oAc8iob2XEU9QQf9LeQ
         KdNw==
X-Gm-Message-State: AOJu0YzN0fAQsxEM6aJQF8cOFIiXYNG91gdAsPSVbYUbyAQgFkaTg3qb
	VA9zcjYSevBDjiieXbM6uUDvpkYW9iCPUXpkV9h4v24JHdCiOH5Ct0NFpFI1m2vbWPisbg==
X-Gm-Gg: ASbGncuge8Cpe0IME966rpzx3OMV+2Pe0iOi6teGfFVEsCdwh7HFay+062LC5S6Ntya
	sqwMVLtGhBrXPGrWNZj1QkHn1H3HEnLHe1k5E0gPsmV2FqRCPnPHAR8t9vUzK4tsKfsHvFhI46G
	J7kANgEmeG+bhFazso8XCuFqjRQNSrfL3A0Ag/J8t+Pea74QBK75Tb0Ibm8nf8OVT7OnZGizBXm
	B0EB26VT/0Yne+tZVu7VBQenfr8Xg45WOv0EEkIn688Lj5DqPtoJHLyt5uRiDZD0ToSGFOODSh7
	EnHE6e0QX+eMAaxM8H3tYJXj6RDmdOEyO+/1NRp9P2D74RT2evnuq3hEi/9DfejIAijHLa9jaJ2
	M2LcP6rgea44DNPOlHw1cdSKge3GaX5kB1+U0t0oc6ccAEBCa5yutjwbQm5vz9led0jr0tfRGXF
	mo/GtQpeKCP1IRwV0r8X4bp8egWNUWWP525ZQRO5mZFmjjjlZaO5fInLa09tuI
X-Google-Smtp-Source: AGHT+IG+u/D2ojHAFZCIpbCUQXejiKa5TSmyEEakzXpWUyiNnYGjczDrzbWmmSlnUvwW6TozznD9fQ==
X-Received: by 2002:a05:6a00:1250:b0:7a2:766f:5198 with SMTP id d2e1a72fcca58-7b0bdf68b4cmr5140598b3a.29.1762535597807;
        Fri, 07 Nov 2025 09:13:17 -0800 (PST)
Received: from localhost.localdomain (61-230-132-96.dynamic-ip.hinet.net. [61.230.132.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9ff848bsm3502732b3a.29.2025.11.07.09.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 09:13:17 -0800 (PST)
From: Yiwei Lin <s921975628@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yiwei Lin <s921975628@gmail.com>
Subject: [PATCH v2] ASoC: dapm-graph: Handle sound card with space in name
Date: Sat,  8 Nov 2025 01:13:02 +0800
Message-Id: <20251107171302.2228-1-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the name of the sound card has a space
between, the script will fail to output the
dot file. Consider the case to generate it
correctly.

Signed-off-by: Yiwei Lin <s921975628@gmail.com>
---
 tools/sound/dapm-graph | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/sound/dapm-graph b/tools/sound/dapm-graph
index b6196ee50..22993317d 100755
--- a/tools/sound/dapm-graph
+++ b/tools/sound/dapm-graph
@@ -174,7 +174,7 @@ process_dapm_component()
 
 	# Extract directory name into component name:
 	#   "./cs42l51.0-004a/dapm" -> "cs42l51.0-004a"
-	c_name="$(basename $(dirname "${c_dir}"))"
+	c_name="$(basename "$(dirname "${c_dir}")")"
     fi
 
     dbg_echo " * Component: ${c_name}"
@@ -201,7 +201,7 @@ process_dapm_component()
     >"${links_file}"
 
     # Iterate over widgets in the component dir
-    for w_file in ${c_dir}/*; do
+    for w_file in "${c_dir}"/*; do
 	process_dapm_widget "${tmp_dir}" "${c_name}" "${w_file}"
     done
 
-- 
2.34.1

