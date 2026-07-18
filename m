Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6B43CCFD2
	for <linux-sound@vger.kernel.org>; Sat, 18 Jul 2026 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784385630; cv=none; b=OD1MCHu6q6wZY6F3wmG8L9W/MM/lPUc3S4qm7SHDB+eJ9ldp7f0p67UsnSMWuSsaW5e4VQeDAcsT+KgRYWOIBv6cc/9x+cGiAgq2oaQJSZQHuwjnHzzXUTDRzhwe0te6yfu7jQMfpDXNbZX3WrSsXWaiBwCZyTmti8ZZ6PHDtcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784385630; c=relaxed/simple;
	bh=TqP0TFJQUlLEnc53mcEJzxksDYYarkOPW6cMJpOwh2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LbENEvlHoADYsPImVRkCm7S1+Sp/I8+xMeX9pRtvXyq4hzy8Josj4lKNq1LY0lZcOXSx3N/siwwIaBsYQhBLSDF8TM1hZCmLqGN2QSRQFzdQHA8EU4MEsXBRy0VssUaoWLA0z0ucnd03bxtdXRIJzoX3mqfwun3l5PTQrkazmpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=HnV3VvM6; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="HnV3VvM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1784990426; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	Content-Transfer-Encoding:Feedback-Id; bh=y5RolVEjohR8iEYsN2yIrD
	zUxPhtuWkOz+4WmCgUedM=; b=HnV3VvM6ld9+AOQaLCLZ29z+plOf9hVWkWOkWw
	sZqMDWMkrd9+e9t9csZvVRbNh4JCNSMsWonjhW01nrrbDt5/snzugx4CJ+C2pMe7
	aGPtV8PqRYnUwP/jywV7j7KyAYsPqlhHRgECp0Fsk+b4jg2H7Hl/2twTUCSU7nV9
	5P38o=
Received: (qmail 1927152 invoked from network); 18 Jul 2026 14:40:24 -0000
Received: from 105.76.9.106  by turbo-smtp.com with SMTP; 18 Jul 2026 14:40:23 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e639f575f42e007-007-4288be33
From: Yahya Toubali <yahya@yahyatoubali.me>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-doc@vger.kernel.org (open list:DOCUMENTATION), linux-kernel@vger.kernel.org (open list), workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS), linux-sound@vger.kernel.org (open list:SOUND)
Cc: Yahya Toubali <yahya@yahyatoubali.me>
Subject: [PATCH 5/5] Documentation: add SPDX license identifiers to RST files
Date: Sat, 18 Jul 2026 15:40:04 +0100
Message-ID: <20260718144005.1880568-1-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

Add SPDX-License-Identifier: GPL-2.0 to documentation files that were missing it.
---
 Documentation/core-api/memory-allocation.rst | 1 +
 Documentation/doc-guide/sphinx.rst           | 1 +
 Documentation/process/5.Posting.rst          | 1 +
 Documentation/process/howto.rst              | 1 +
 Documentation/sound/designs/index.rst        | 2 ++
 5 files changed, 6 insertions(+)

diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
index 0f19dd524323..370f5a0c4238 100644
--- a/Documentation/core-api/memory-allocation.rst
+++ b/Documentation/core-api/memory-allocation.rst
@@ -1,4 +1,5 @@
 .. _memory_allocation:
+.. SPDX-License-Identifier: GPL-2.0
 
 =======================
 Memory Allocation Guide
diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
index 51c370260f3b..74a3425e81c9 100644
--- a/Documentation/doc-guide/sphinx.rst
+++ b/Documentation/doc-guide/sphinx.rst
@@ -1,4 +1,5 @@
 .. _sphinxdoc:
+.. SPDX-License-Identifier: GPL-2.0
 
 =====================================
 Using Sphinx for kernel documentation
diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
index 07d7dbed13ec..510abeea8977 100644
--- a/Documentation/process/5.Posting.rst
+++ b/Documentation/process/5.Posting.rst
@@ -1,4 +1,5 @@
 .. _development_posting:
+.. SPDX-License-Identifier: GPL-2.0
 
 Posting patches
 ===============
diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 9438e03d6f50..9001024e44cf 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -1,4 +1,5 @@
 .. _process_howto:
+.. SPDX-License-Identifier: GPL-2.0
 
 HOWTO do Linux kernel development
 =================================
diff --git a/Documentation/sound/designs/index.rst b/Documentation/sound/designs/index.rst
index 6b825c5617fc..4ba4038187b5 100644
--- a/Documentation/sound/designs/index.rst
+++ b/Documentation/sound/designs/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 Designs and Implementations
 ===========================
 
-- 
2.55.0


