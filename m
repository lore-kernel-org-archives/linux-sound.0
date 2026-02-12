Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E8A299943
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 19:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770923670; cv=none; b=H3UozGS1NA41uSn2T99AeomAlYe/4FG3jn1kbIzmEwXKYcgaf8K0aBczBqQT/CnKA0LTLcjNPplJaE7mOf0g6uTSjlPJz2VxKLneSc01SwuBF2r4Wea11amL8zsU0n8OCts5m/qug/398Pp3zCdVTr9qt2y1i+2Db9xgRKX3Wzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770923670; c=relaxed/simple;
	bh=vRIhXOcuSVaBBAxyQLVRjWtMNs9xUlj0tw4k1JMv6eU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WKb6nxUTaPb28+9OxKVXKs8WESnurT/FSJQ3YLlZehT+YAYNjTZ0yJmC30FJG+QcaLTIf0IEAUDIrnA3V2Vy7iWt4aehLnWNKkafsVwHNPq1mn1OB3Fj6sc+pmX1/fCp0r7Ve52UYpil3e/m3QtTRaf52u6CzU3WiRZuv/zJfX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id qVMavAjA1CxrGqc8xv1A1n; Thu, 12 Feb 2026 19:14:27 +0000
Received: from host2044.hostmonster.com ([67.20.76.238])
	by cmsmtp with ESMTPS
	id qc8wvbHuvSqlVqc8xvWwm9; Thu, 12 Feb 2026 19:14:27 +0000
X-Authority-Analysis: v=2.4 cv=I7FlRMgg c=1 sm=1 tr=0 ts=698e2693
 a=O1AQXT3IpLm5MaED65xONQ==:117 a=uc9KWs4yn0V/JYYSH7YHpg==:17
 a=HzLeVaNsDn8A:10 a=z6gsHLkEAAAA:8 a=cDym0dv03349cYdJ0XsA:9 a=RVmHIydaz68A:10
 a=KsjdKihiusvmYKwfN6su:22 a=iekntanDnrheIxGr1pkv:22
Received: from [66.118.46.62] (port=33666 helo=timdesk..)
	by host2044.hostmonster.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <tim.bird@sony.com>)
	id 1vqc8u-00000003DWj-03Sq;
	Thu, 12 Feb 2026 12:14:24 -0700
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
Subject: [PATCH] sound: drivers: opl4: Add SPDX id lines to files
Date: Thu, 12 Feb 2026 12:14:16 -0700
Message-ID: <20260212191416.3723397-1-tim.bird@sony.com>
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
X-Exim-ID: 1vqc8u-00000003DWj-03Sq
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (timdesk..) [66.118.46.62]:33666
X-Source-Auth: tim@bird.org
X-Email-Count: 3
X-Org: HG=bhshared_hm;ORG=bluehost;
X-Source-Cap: YmlyZG9yZztiaXJkb3JnO2hvc3QyMDQ0Lmhvc3Rtb25zdGVyLmNvbQ==
X-Local-Domain: no
X-CMAE-Envelope: MS4xfA3FZHbmb3AlWL64sNZn0PxrT/Zn675tvgfYjB7ZAz2g8m+WpnQKvzr5wUOhA2ayvtIgYZke4O9xxrk9r8/wr6a27reO94S2yGA8+EWIT1nZEf69s+Tp
 tyYfOq2nopg1D/vGTVk+0K48YV1T23/gcoB6y7dxrwYZEzIvPAT9A+4VDlLbmTpUpWd7Gj5OnLED3TBcM2HOOCp11ettR6eqZiU=

Add a license file to reflect variants of BSD licenses, with the
first variant being a BSD-3-Clause license modified to
remove clause 2 (attribution on binary formats).  Add the SPDX id:
"GPL-2.0-or-later OR LicenseRef-BSD-variants"
to capture the complexity of custom licenses.

Signed-off-by: Tim Bird <tim.bird@sony.com>
---
 LICENSES/deprecated/BSD-variants | 32 ++++++++++++++++++++++++++++++++
 sound/drivers/opl4/opl4_local.h  | 27 +--------------------------
 sound/drivers/opl4/opl4_seq.c    | 27 +--------------------------
 sound/drivers/opl4/opl4_synth.c  | 27 +--------------------------
 sound/drivers/opl4/yrw801.c      | 27 +--------------------------
 5 files changed, 36 insertions(+), 104 deletions(-)
 create mode 100644 LICENSES/deprecated/BSD-variants

diff --git a/LICENSES/deprecated/BSD-variants b/LICENSES/deprecated/BSD-variants
new file mode 100644
index 000000000000..83f24d68fb87
--- /dev/null
+++ b/LICENSES/deprecated/BSD-variants
@@ -0,0 +1,32 @@
+Valid-License-Identifier: LicenseRef-BSD-variant1
+
+Description:
+Here is the "no-binary-attribution" variant of a BSD license, numbered
+here as variant1.  It is a standard BSD-3-Clause license, with the
+condition removed for attribution required in binary formats.
+
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
index a16b4677c1e9..4914ddc27576 100644
--- a/sound/drivers/opl4/opl4_local.h
+++ b/sound/drivers/opl4/opl4_local.h
@@ -1,34 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR LicenseRef-BSD-variant1 */
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
index 7bb22089a093..4ace07e885c1 100644
--- a/sound/drivers/opl4/opl4_seq.c
+++ b/sound/drivers/opl4/opl4_seq.c
@@ -1,34 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR LicenseRef-BSD-variant1
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
index 82dbb8519ab1..a6a605a3abf6 100644
--- a/sound/drivers/opl4/opl4_synth.c
+++ b/sound/drivers/opl4/opl4_synth.c
@@ -1,34 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR LicenseRef-BSD-variant1
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
index 9e464b84b905..34f140bf0fd3 100644
--- a/sound/drivers/opl4/yrw801.c
+++ b/sound/drivers/opl4/yrw801.c
@@ -1,34 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR LicenseRef-BSD-variant1
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

