Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D1C3D47D4
	for <linux-sound@vger.kernel.org>; Sat, 18 Jul 2026 15:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784387994; cv=none; b=WC/AnnHLlMptLDEThNYkgTV4EatySj9zwN+X11UJwtdswSD5VSMJN996z0BxzQVa3xu/d7/aPW6mjsyB2bjMwbJwcPX2duf3n3tBKvAfh8sv1qriabHo5OI/CCzzojWi/8gWcMeIqZQ1dkYHnoFfqrt6O6sNVkAmykdA9eWm2Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784387994; c=relaxed/simple;
	bh=DR2qKnVDgzwixDUv3bCjgDUy02F9ioJiss0Tl9XL0yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvca4OcYDWonTaUb943CGRm/Duq3HYJMLZwNcoKCFse13VY7FXOQYnRHPBhxxdMb3yDPrgyFRFsr/Qp3s+IIOCeiIkC9D9vvTaum7ljbAB3BF/jtqRFPpvQ9nvzRx/+WBjBAPnYmHqksvbig4eHEBHDnafsOve3MwlquVs+TUC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=crowZkTb; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="crowZkTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1784992791; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	References:MIME-Version:Content-Transfer-Encoding:Feedback-Id;
	bh=0Z1/BBoIV4rhIv9gAFPaztp46PkLCn+wYTZBWlf7mRU=; b=crowZkTb+xdrt
	l3i17JKQBIR5i7URMIIrDAUKvggUgHLCLuUATBQI18HLIXMHAxeHkuZhsy83OlRO
	fgB7tizKyE3Jl1B4IXptFtx/UwhaqQwQWxL+6ZMb/0UuqmLaiD0/oytz7b4pLqet
	1FyPq9w+rlReTw36su3kx8TXscLo6Q=
Received: (qmail 2205062 invoked from network); 18 Jul 2026 15:19:49 -0000
Received: from 105.76.9.106  by turbo-smtp.com with SMTP; 18 Jul 2026 15:19:48 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e63a85d8442c007-007-4288be33
From: Yahya Toubali <yahya@yahyatoubali.me>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-doc@vger.kernel.org (open list:DOCUMENTATION), linux-kernel@vger.kernel.org (open list), workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS), linux-sound@vger.kernel.org (open list:SOUND)
Cc: Yahya Toubali <yahya@yahyatoubali.me>
Subject: [PATCH 5/5] Documentation: add SPDX license identifiers to RST files
Date: Sat, 18 Jul 2026 16:19:11 +0100
Message-ID: <20260718151913.1892547-5-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260718151913.1892547-1-yahya@yahyatoubali.me>
References: <20260718151913.1892547-1-yahya@yahyatoubali.me>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

Add SPDX-License-Identifier: GPL-2.0 to documentation files that were missing it.

Signed-off-by: Yahya Toubali <yahya@yahyatoubali.me>
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


