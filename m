Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55BE31B838
	for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 23:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771370581; cv=none; b=j+LUUmaFhyLX1cfI3rNBz6sb+f/98flZtfSjZgTGuBXy1C/3f55bIw4KAy+LU1nB7zW6x7hrBB98iHp+fJ8spxbSEsshs2AFMZD6KpoTrXLafO5Y5Q41y55mslj99lJcCZkAsXVjXxMDORaFnM3KhMx/RRePsZMs8zm04wluoB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771370581; c=relaxed/simple;
	bh=iFYlGFSZTXMuh1py2ogaGWuUbEKYUBRnkM5e+cEO3w4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ShFJVgNWb6A6cRnIzWGwWmob+eCGqEC+R7dYm1sxdDiCXm/Gky3aBZtjK663x/Is0Sacjy58Ni16T2hdn2hsE6fwuJLJXvnUpxvY0H2UV2ANLSK11pRZe0e1p1pvLUPTJltItM+ZwQocQZZNM+/x0pU+dp4t1sUVFyGIxjwcwSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id sQIovuUPRKXDJsUP7vWTQf; Tue, 17 Feb 2026 23:22:53 +0000
Received: from host2044.hostmonster.com ([67.20.76.238])
	by cmsmtp with ESMTPS
	id sUP6vxB0choT4sUP6vbsCK; Tue, 17 Feb 2026 23:22:52 +0000
X-Authority-Analysis: v=2.4 cv=XZyJzJ55 c=1 sm=1 tr=0 ts=6994f84d
 a=O1AQXT3IpLm5MaED65xONQ==:117 a=uc9KWs4yn0V/JYYSH7YHpg==:17
 a=HzLeVaNsDn8A:10 a=24AZYWMyAAAA:8 a=z6gsHLkEAAAA:8 a=cDym0dv03349cYdJ0XsA:9
 a=CFjvgroRm8IA:10 a=RVmHIydaz68A:10 a=bG88sKzkDEFeXWNnvthB:22
 a=iekntanDnrheIxGr1pkv:22
Received: from [66.118.46.62] (port=38406 helo=timdesk..)
	by host2044.hostmonster.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <tim.bird@sony.com>)
	id 1vsUOx-00000000gFE-3qPt;
	Tue, 17 Feb 2026 16:22:44 -0700
From: Tim Bird <tim.bird@sony.com>
To: perex@perex.cz,
	tiwai@suse.com,
	clemens@ladisch.de,
	tglx@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-spdx@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Bird <tim.bird@sony.com>
Subject: [PATCH v2] ALSA: opl4: Add SPDX id lines to files in opl4 driver
Date: Tue, 17 Feb 2026 16:22:30 -0700
Message-ID: <20260217232230.241142-1-tim.bird@sony.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2044.hostmonster.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sony.com
X-BWhitelist: no
X-Source-IP: 66.118.46.62
X-Source-L: No
X-Exim-ID: 1vsUOx-00000000gFE-3qPt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (timdesk..) [66.118.46.62]:38406
X-Source-Auth: tim@bird.org
X-Email-Count: 3
X-Org: HG=bhshared_hm;ORG=bluehost;
X-Source-Cap: YmlyZG9yZztiaXJkb3JnO2hvc3QyMDQ0Lmhvc3Rtb25zdGVyLmNvbQ==
X-Local-Domain: no
X-CMAE-Envelope: MS4xfJLMjOp7jZgoUisGoNT8sRZZqWstGQrkec5OZKZBvoUUojCNkPkxBwxa+hC0r4ZNKXg3YvMwyGghgkDD9HRf6LfS97MKpGj24Qd+wipXQ7ge/xTyuoUu
 2bxwd3MqnMoSsk1xZg1/sw4iaN2EQR2fssXFXyHX8/KV6jUfKgyOqOzM9MwJp/O/dGH4CAzt6uAVi9t4p5WCOw5cCddv06hkiVA=

Add a license file for the BSD-Source-Code license variant.
Add "SPDX-License-Identifier GPL-2.0-or-later OR BSD-Source-Code"
to files using this license and the 'Alternatively...' language.
Remove the boilerplate text from the files.

Signed-off-by: Tim Bird <tim.bird@sony.com>
---
 LICENSES/deprecated/BSD-Source-Code | 32 +++++++++++++++++++++++++++++
 sound/drivers/opl4/opl4_local.h     | 27 +-----------------------
 sound/drivers/opl4/opl4_seq.c       | 27 +-----------------------
 sound/drivers/opl4/opl4_synth.c     | 27 +-----------------------
 sound/drivers/opl4/yrw801.c         | 27 +-----------------------
 5 files changed, 36 insertions(+), 104 deletions(-)
 create mode 100644 LICENSES/deprecated/BSD-Source-Code

diff --git a/LICENSES/deprecated/BSD-Source-Code b/LICENSES/deprecated/BSD-Source-Code
new file mode 100644
index 000000000000..600cfea43526
--- /dev/null
+++ b/LICENSES/deprecated/BSD-Source-Code
@@ -0,0 +1,32 @@
+Valid-License-Identifier: BSD-Source-Code
+SPDX-URL: https://spdx.org/licenses/BSD-Source-Code.html
+Usage:
+  To use the BSD Source Code License, put the following SPDX tag/value
+  pair into a comment according to the placement guidelines in the
+  licensing rules documentation:
+    SPDX-License-Identifier: BSD-Source-Code
+License-Text:
+
+Copyright (c) <year> <owner> . All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions are met:
+
+ - Redistributions of source code must retain the above copyright notice,
+   this list of conditions and the following disclaimer,
+   without modification.
+
+ - The name of the author may not be used to endorse or promote products
+   derived from this software without specific prior written permission.
+
+THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS "AS IS" AND
+ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR
+ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+SUCH DAMAGE.
diff --git a/sound/drivers/opl4/opl4_local.h b/sound/drivers/opl4/opl4_local.h
index a16b4677c1e9..6dc223c6dc75 100644
--- a/sound/drivers/opl4/opl4_local.h
+++ b/sound/drivers/opl4/opl4_local.h
@@ -1,34 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-Source-Code */
 /*
  * Local definitions for the OPL4 driver
  *
  * Copyright (c) 2003 by Clemens Ladisch <clemens@ladisch.de>
  * All rights reserved.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions, and the following disclaimer,
- *    without modification.
- * 2. The name of the author may not be used to endorse or promote products
- *    derived from this software without specific prior written permission.
- *
- * Alternatively, this software may be distributed and/or modified under the
- * terms of the GNU General Public License as published by the Free Software
- * Foundation; either version 2 of the License, or (at your option) any later
- * version.
- *
- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR
- * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
- * SUCH DAMAGE.
  */
 
 #ifndef __OPL4_LOCAL_H
diff --git a/sound/drivers/opl4/opl4_seq.c b/sound/drivers/opl4/opl4_seq.c
index 7bb22089a093..751b9f06aad8 100644
--- a/sound/drivers/opl4/opl4_seq.c
+++ b/sound/drivers/opl4/opl4_seq.c
@@ -1,34 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-Source-Code
 /*
  * OPL4 sequencer functions
  *
  * Copyright (c) 2003 by Clemens Ladisch <clemens@ladisch.de>
  * All rights reserved.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions, and the following disclaimer,
- *    without modification.
- * 2. The name of the author may not be used to endorse or promote products
- *    derived from this software without specific prior written permission.
- *
- * Alternatively, this software may be distributed and/or modified under the
- * terms of the GNU General Public License as published by the Free Software
- * Foundation; either version 2 of the License, or (at your option) any later
- * version.
- *
- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR
- * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
- * SUCH DAMAGE.
  */
 
 #include "opl4_local.h"
diff --git a/sound/drivers/opl4/opl4_synth.c b/sound/drivers/opl4/opl4_synth.c
index 82dbb8519ab1..c3a91a348d9a 100644
--- a/sound/drivers/opl4/opl4_synth.c
+++ b/sound/drivers/opl4/opl4_synth.c
@@ -1,34 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-Source-Code
 /*
  * OPL4 MIDI synthesizer functions
  *
  * Copyright (c) 2003 by Clemens Ladisch <clemens@ladisch.de>
  * All rights reserved.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions, and the following disclaimer,
- *    without modification.
- * 2. The name of the author may not be used to endorse or promote products
- *    derived from this software without specific prior written permission.
- *
- * Alternatively, this software may be distributed and/or modified under the
- * terms of the GNU General Public License as published by the Free Software
- * Foundation; either version 2 of the License, or (at your option) any later
- * version.
- *
- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR
- * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
- * SUCH DAMAGE.
  */
 
 #include "opl4_local.h"
diff --git a/sound/drivers/opl4/yrw801.c b/sound/drivers/opl4/yrw801.c
index 9e464b84b905..d7ce3ef9e6d4 100644
--- a/sound/drivers/opl4/yrw801.c
+++ b/sound/drivers/opl4/yrw801.c
@@ -1,34 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-Source-Code
 /*
  * Information about the Yamaha YRW801 wavetable ROM chip
  *
  * Copyright (c) 2003 by Clemens Ladisch <clemens@ladisch.de>
  * All rights reserved.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions, and the following disclaimer,
- *    without modification.
- * 2. The name of the author may not be used to endorse or promote products
- *    derived from this software without specific prior written permission.
- *
- * Alternatively, this software may be distributed and/or modified under the
- * terms of the GNU General Public License as published by the Free Software
- * Foundation; either version 2 of the License, or (at your option) any later
- * version.
- *
- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR
- * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
- * SUCH DAMAGE.
  */
 
 #include "opl4_local.h"
-- 
2.43.0

