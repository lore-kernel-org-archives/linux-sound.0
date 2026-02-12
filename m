Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B611DE4EF
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 23:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770940183; cv=none; b=LI3Q/0gQ+ENeaAE754oH3D6diEdL4SXRpDnd7dCoUITN+MMnr/Zn14nRTGuq/bvEiEBtTQSYpp7FtLgwrsEODCS70ZWT/uAmxxMgIhhFkjBkIinHWjL23KweiWioA/L2ABO6yRXC5mQsdldMv4uRPUoHB3K7FIRoIL556/KMKOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770940183; c=relaxed/simple;
	bh=R5bvxOUBU1dzWKNNWvX4MCbEp5Kg++0s9Yn01IjrpiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EfRO9E1AJAOsI55CJiLwdu2PdmuCfk6KCTVorSTSkeCo3m97IkldaInlCNEVRTu28JYqjtB9C1NP/r+Qm/tvuYaB5jKJzgjAJiZsI2NkHfd5Rx++gFI1KBkIM/InxoNCEwBF45ktkaG5hiCaWMlu6Ra4AQ4aKOh9a+vBP2KxdJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id qaJivVVhsaPqLqgRHvI4fq; Thu, 12 Feb 2026 23:49:39 +0000
Received: from host2044.hostmonster.com ([67.20.76.238])
	by cmsmtp with ESMTPS
	id qgRGvsAuEhoT4qgRHvprVM; Thu, 12 Feb 2026 23:49:39 +0000
X-Authority-Analysis: v=2.4 cv=XZyJzJ55 c=1 sm=1 tr=0 ts=698e6713
 a=O1AQXT3IpLm5MaED65xONQ==:117 a=uc9KWs4yn0V/JYYSH7YHpg==:17
 a=HzLeVaNsDn8A:10 a=z6gsHLkEAAAA:8 a=CoX6uBoLAAAA:8 a=rS5BYXbZqw19zhbpsZsA:9
 a=RVmHIydaz68A:10 a=db-f62MsAh6zBBU8Jghj:22 a=iekntanDnrheIxGr1pkv:22
Received: from [66.118.46.62] (port=51466 helo=timdesk..)
	by host2044.hostmonster.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <tim.bird@sony.com>)
	id 1vqgRD-000000005Pt-3tS3;
	Thu, 12 Feb 2026 16:49:36 -0700
From: Tim Bird <tim.bird@sony.com>
To: perex@perex.cz,
	tiwai@suse.com,
	pochini@shiny.it
Cc: linux-spdx@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Bird <tim.bird@sony.com>
Subject: [PATCH] sound: echoaudio: Add SPDX ids to some files
Date: Thu, 12 Feb 2026 16:49:28 -0700
Message-ID: <20260212234928.3739815-1-tim.bird@sony.com>
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
X-Exim-ID: 1vqgRD-000000005Pt-3tS3
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (timdesk..) [66.118.46.62]:51466
X-Source-Auth: tim@bird.org
X-Email-Count: 3
X-Org: HG=bhshared_hm;ORG=bluehost;
X-Source-Cap: YmlyZG9yZztiaXJkb3JnO2hvc3QyMDQ0Lmhvc3Rtb25zdGVyLmNvbQ==
X-Local-Domain: no
X-CMAE-Envelope: MS4xfL602aWPP3FoCb1uO/hIHL68+mSv16dUKUkwdnIY+Edu0KWlWOfozuXKKt2SPF626HPcayBB4dfzaTzWWzSaYACw5vOhxobaIvgfRvv4SpfTKbdabrhu
 tKyVnqH5XqtzlOnd78O+Y0Ot6gWGWMOd9eTsMvUHhPlm/Ca/ZbzVloY2CwaE4gPoe1TjIJgsZqnjVBhE/B6HL9zVXK3ijCYNMNI=

Add SPDX-License-Identifier lines to some files in the
sound subsystem - mostly in the echoaudio drivers.
Remove boilerplate GPL headers.

Signed-off-by: Tim Bird <tim.bird@sony.com>
---
 sound/oss/dmasound/dmasound_core.c       |  5 +----
 sound/pci/echoaudio/darla20_dsp.c        | 17 +----------------
 sound/pci/echoaudio/darla24_dsp.c        | 17 +----------------
 sound/pci/echoaudio/echo3g_dsp.c         | 17 +----------------
 sound/pci/echoaudio/echoaudio.h          | 17 +----------------
 sound/pci/echoaudio/echoaudio_3g.c       | 17 +----------------
 sound/pci/echoaudio/echoaudio_dsp.c      | 17 +----------------
 sound/pci/echoaudio/echoaudio_dsp.h      | 17 +----------------
 sound/pci/echoaudio/echoaudio_gml.c      | 17 +----------------
 sound/pci/echoaudio/gina20_dsp.c         | 17 +----------------
 sound/pci/echoaudio/gina24_dsp.c         | 17 +----------------
 sound/pci/echoaudio/indigo_dsp.c         | 17 +----------------
 sound/pci/echoaudio/indigo_express_dsp.c | 17 +----------------
 sound/pci/echoaudio/indigodj_dsp.c       | 17 +----------------
 sound/pci/echoaudio/indigodjx_dsp.c      | 17 +----------------
 sound/pci/echoaudio/indigoio_dsp.c       | 17 +----------------
 sound/pci/echoaudio/indigoiox_dsp.c      | 17 +----------------
 sound/pci/echoaudio/layla20_dsp.c        | 17 +----------------
 sound/pci/echoaudio/layla24_dsp.c        | 16 +---------------
 sound/pci/echoaudio/mia_dsp.c            | 17 +----------------
 sound/pci/echoaudio/midi.c               | 17 +----------------
 sound/pci/echoaudio/mona_dsp.c           | 17 +----------------
 sound/pci/ens1371.c                      |  1 +
 23 files changed, 23 insertions(+), 339 deletions(-)

diff --git a/sound/oss/dmasound/dmasound_core.c b/sound/oss/dmasound/dmasound_core.c
index dea2d9b18fc9..a718b75bb6a0 100644
--- a/sound/oss/dmasound/dmasound_core.c
+++ b/sound/oss/dmasound/dmasound_core.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  *  linux/sound/oss/dmasound/dmasound_core.c
  *
@@ -21,10 +22,6 @@
  *  /dev/sndstat is based on code by Hannu Savolainen, the author of the
  *  VoxWare family of drivers.
  *
- *  This file is subject to the terms and conditions of the GNU General Public
- *  License.  See the file COPYING in the main directory of this archive
- *  for more details.
- *
  *  History:
  *
  *	1995/8/25	First release
diff --git a/sound/pci/echoaudio/darla20_dsp.c b/sound/pci/echoaudio/darla20_dsp.c
index 0356efad7528..5a41644b16b0 100644
--- a/sound/pci/echoaudio/darla20_dsp.c
+++ b/sound/pci/echoaudio/darla20_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /***************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/darla24_dsp.c b/sound/pci/echoaudio/darla24_dsp.c
index b96300772aee..5dc0efaca425 100644
--- a/sound/pci/echoaudio/darla24_dsp.c
+++ b/sound/pci/echoaudio/darla24_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /***************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/echo3g_dsp.c b/sound/pci/echoaudio/echo3g_dsp.c
index 9e1f2cad0909..38084c2c3f73 100644
--- a/sound/pci/echoaudio/echo3g_dsp.c
+++ b/sound/pci/echoaudio/echo3g_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/echoaudio.h b/sound/pci/echoaudio/echoaudio.h
index 511f2fcc0fb9..7a5744bf3155 100644
--- a/sound/pci/echoaudio/echoaudio.h
+++ b/sound/pci/echoaudio/echoaudio.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
  ****************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/echoaudio_3g.c b/sound/pci/echoaudio/echoaudio_3g.c
index c9ee98ea3c71..4b3c6a8bc66a 100644
--- a/sound/pci/echoaudio/echoaudio_3g.c
+++ b/sound/pci/echoaudio/echoaudio_3g.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/echoaudio_dsp.c b/sound/pci/echoaudio/echoaudio_dsp.c
index 2a40091d472c..0c07e89e5df3 100644
--- a/sound/pci/echoaudio/echoaudio_dsp.c
+++ b/sound/pci/echoaudio/echoaudio_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/echoaudio_dsp.h b/sound/pci/echoaudio/echoaudio_dsp.h
index aa9129519795..4f73bc037f59 100644
--- a/sound/pci/echoaudio/echoaudio_dsp.h
+++ b/sound/pci/echoaudio/echoaudio_dsp.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/echoaudio_gml.c b/sound/pci/echoaudio/echoaudio_gml.c
index 248983fa2959..682a8cc63f0b 100644
--- a/sound/pci/echoaudio/echoaudio_gml.c
+++ b/sound/pci/echoaudio/echoaudio_gml.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/gina20_dsp.c b/sound/pci/echoaudio/gina20_dsp.c
index c93939850357..ba4c398f8611 100644
--- a/sound/pci/echoaudio/gina20_dsp.c
+++ b/sound/pci/echoaudio/gina20_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/gina24_dsp.c b/sound/pci/echoaudio/gina24_dsp.c
index 78fbac9f3eac..fa1d8c06f059 100644
--- a/sound/pci/echoaudio/gina24_dsp.c
+++ b/sound/pci/echoaudio/gina24_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/indigo_dsp.c b/sound/pci/echoaudio/indigo_dsp.c
index 16eb082df56a..c53643279cdd 100644
--- a/sound/pci/echoaudio/indigo_dsp.c
+++ b/sound/pci/echoaudio/indigo_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/indigo_express_dsp.c b/sound/pci/echoaudio/indigo_express_dsp.c
index ceda2d7046ac..7a032b702498 100644
--- a/sound/pci/echoaudio/indigo_express_dsp.c
+++ b/sound/pci/echoaudio/indigo_express_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
 /************************************************************************
 
 This file is part of Echo Digital Audio's generic driver library.
@@ -5,22 +6,6 @@ Copyright Echo Digital Audio Corporation (c) 1998 - 2005
 All rights reserved
 www.echoaudio.com
 
-This library is free software; you can redistribute it and/or
-modify it under the terms of the GNU Lesser General Public
-License as published by the Free Software Foundation; either
-version 2.1 of the License, or (at your option) any later version.
-
-This library is distributed in the hope that it will be useful,
-but WITHOUT ANY WARRANTY; without even the implied warranty of
-MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-Lesser General Public License for more details.
-
-You should have received a copy of the GNU Lesser General Public
-License along with this library; if not, write to the Free Software
-Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-
-*************************************************************************
-
  Translation from C++ and adaptation for use in ALSA-Driver
  were made by Giuliano Pochini <pochini@shiny.it>
 
diff --git a/sound/pci/echoaudio/indigodj_dsp.c b/sound/pci/echoaudio/indigodj_dsp.c
index 17a1d888d0b9..0f8299ab123f 100644
--- a/sound/pci/echoaudio/indigodj_dsp.c
+++ b/sound/pci/echoaudio/indigodj_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/indigodjx_dsp.c b/sound/pci/echoaudio/indigodjx_dsp.c
index 5fbd4a3a3083..677cd8ed7cc4 100644
--- a/sound/pci/echoaudio/indigodjx_dsp.c
+++ b/sound/pci/echoaudio/indigodjx_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
 /************************************************************************
 
 This file is part of Echo Digital Audio's generic driver library.
@@ -5,22 +6,6 @@ Copyright Echo Digital Audio Corporation (c) 1998 - 2005
 All rights reserved
 www.echoaudio.com
 
-This library is free software; you can redistribute it and/or
-modify it under the terms of the GNU Lesser General Public
-License as published by the Free Software Foundation; either
-version 2.1 of the License, or (at your option) any later version.
-
-This library is distributed in the hope that it will be useful,
-but WITHOUT ANY WARRANTY; without even the implied warranty of
-MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-Lesser General Public License for more details.
-
-You should have received a copy of the GNU Lesser General Public
-License along with this library; if not, write to the Free Software
-Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-
-*************************************************************************
-
  Translation from C++ and adaptation for use in ALSA-Driver
  were made by Giuliano Pochini <pochini@shiny.it>
 
diff --git a/sound/pci/echoaudio/indigoio_dsp.c b/sound/pci/echoaudio/indigoio_dsp.c
index 791787aa0744..55d6431c8291 100644
--- a/sound/pci/echoaudio/indigoio_dsp.c
+++ b/sound/pci/echoaudio/indigoio_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/indigoiox_dsp.c b/sound/pci/echoaudio/indigoiox_dsp.c
index 1ae394ea7c7d..48958e51d414 100644
--- a/sound/pci/echoaudio/indigoiox_dsp.c
+++ b/sound/pci/echoaudio/indigoiox_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
 /************************************************************************
 
 This file is part of Echo Digital Audio's generic driver library.
@@ -5,22 +6,6 @@ Copyright Echo Digital Audio Corporation (c) 1998 - 2005
 All rights reserved
 www.echoaudio.com
 
-This library is free software; you can redistribute it and/or
-modify it under the terms of the GNU Lesser General Public
-License as published by the Free Software Foundation; either
-version 2.1 of the License, or (at your option) any later version.
-
-This library is distributed in the hope that it will be useful,
-but WITHOUT ANY WARRANTY; without even the implied warranty of
-MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-Lesser General Public License for more details.
-
-You should have received a copy of the GNU Lesser General Public
-License along with this library; if not, write to the Free Software
-Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-
-*************************************************************************
-
  Translation from C++ and adaptation for use in ALSA-Driver
  were made by Giuliano Pochini <pochini@shiny.it>
 
diff --git a/sound/pci/echoaudio/layla20_dsp.c b/sound/pci/echoaudio/layla20_dsp.c
index 5fb5c4a4598b..e0349a3c20e4 100644
--- a/sound/pci/echoaudio/layla20_dsp.c
+++ b/sound/pci/echoaudio/layla20_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/layla24_dsp.c b/sound/pci/echoaudio/layla24_dsp.c
index decfccb1e803..e7b8f5fe7753 100644
--- a/sound/pci/echoaudio/layla24_dsp.c
+++ b/sound/pci/echoaudio/layla24_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,21 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/mia_dsp.c b/sound/pci/echoaudio/mia_dsp.c
index 8a4dffc68889..f040a09f3191 100644
--- a/sound/pci/echoaudio/mia_dsp.c
+++ b/sound/pci/echoaudio/mia_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/midi.c b/sound/pci/echoaudio/midi.c
index dd5212644844..4d66163a6bb0 100644
--- a/sound/pci/echoaudio/midi.c
+++ b/sound/pci/echoaudio/midi.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/echoaudio/mona_dsp.c b/sound/pci/echoaudio/mona_dsp.c
index 9bb6a174745c..6089152eb246 100644
--- a/sound/pci/echoaudio/mona_dsp.c
+++ b/sound/pci/echoaudio/mona_dsp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /****************************************************************************
 
    Copyright Echo Digital Audio Corporation (c) 1998 - 2004
@@ -5,22 +6,6 @@
    www.echoaudio.com
 
    This file is part of Echo Digital Audio's generic driver library.
-
-   Echo Digital Audio's generic driver library is free software;
-   you can redistribute it and/or modify it under the terms of
-   the GNU General Public License as published by the Free Software
-   Foundation.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-   MA  02111-1307, USA.
-
    *************************************************************************
 
  Translation from C++ and adaptation for use in ALSA-Driver
diff --git a/sound/pci/ens1371.c b/sound/pci/ens1371.c
index ca0da0ab40b6..694978c4b22d 100644
--- a/sound/pci/ens1371.c
+++ b/sound/pci/ens1371.c
@@ -1,2 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
 #define CHIP1371
 #include "ens1370.c"
-- 
2.43.0

