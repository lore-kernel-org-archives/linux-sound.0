Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2869E21322F
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749578028; cv=pass; b=sfzcB7hB72pI9dYXyLknr+T5TGrip+YocBya3M52ra8NI/cZuf6NqsuSDJcpTjq5i7DwViqPSnXmyKPSH+YAo1cU6S8gamW7PNezsr6Ax2di7+A7scN53kFyQxci3K+YbMOHkA0wWKsT7bNimNRB9HMffHMI6zXWvJz6DA1o/ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749578028; c=relaxed/simple;
	bh=8CVguokDVAfn9eRBjM5VWVhxAf/T1kafjmcoTUzd8HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CWWZW4JPr5oMvDu4SkCfZIGC/7C/80dEmDZ/axi4nx1A5epiVGhqaF0mAFtSAW/5WAH+AGMWYJeVDIzVMLqKMdbuKQ89e8E0p3n4PtrvojEIeme2AHuW8cw63h0zqdg79Y0/T4hyMgYDZYgLKRJsIA3WF3N5KNzfF7EpC5zTSCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digital-rabbithole.de; spf=none smtp.mailfrom=digital-rabbithole.de; dkim=pass (2048-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b=o/cwFLTl; dkim=permerror (0-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b=yRB0LLxR; arc=pass smtp.client-ip=85.215.255.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digital-rabbithole.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=digital-rabbithole.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b="o/cwFLTl";
	dkim=permerror (0-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b="yRB0LLxR"
ARC-Seal: i=1; a=rsa-sha256; t=1749577863; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tB5iDXEz61uo9/q+Own6PjN0jKp7gcUMdHozER8UyERJMrY1J/DN3R/GlmjT8ohSWW
    +BovEApIA8gFuWEocD7EYmkYWzUL+wBbFVVaiBNdzbJZLscSPyHmCfwL3IGutFZM0YxC
    kDEAlqyH6K2bu8a/HqLVxEJyqjUtJq9k4Fj4yr2DIcPSzp4B1/zsA2NRrEvDwv0t28GP
    nTOZqCi5T22nBEKjGmeImIkOZoqzZZx6ZhytTWLihAT/e1/P9n/WTH/nGG1LNc+Cp+X3
    dhbeJegTEl+e4/jQIbSlSgyI+6ncpbASXB8/TQXmxvcd6+J1FUrSsEl8Lg2LH/Gw5EiE
    WLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1749577863;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=T2PpY0dp2d26i0PM2jP2+bIGOYl2S7wQGnslfG3nP08=;
    b=Y1F7XDCaC+RFExMr7WPbF/pGEh0rqW7grynfvwxcXEgpV8CjuhPZzeKX9Cb8NvhgyJ
    viieJJPJhn0XFn54NcNgmVLtnFD4okNMDVI6V5k0eLmx0U3oIEnSMYNp+9OanxTlI1mF
    uK99aczMp3qjPyh+EhnHeQs1Anb5SUiS3vazzI0EMT7FIG+pzLeMOo7WFL3UV/W1Lcfz
    03zzcV/wiYKKnS6A18kXIdXlWHLXPSpWgF2yf/98WnuazylfdndNBCtNuJOJ+L1bh19c
    WRm6wRyW76uVPIGRYLua4yKjfh7eCYy3HrY1kRh2WjxNvyoVT7+cAlEAWWw0JfSGr08O
    GATQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1749577863;
    s=strato-dkim-0002; d=digital-rabbithole.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=T2PpY0dp2d26i0PM2jP2+bIGOYl2S7wQGnslfG3nP08=;
    b=o/cwFLTlS0YfiRwVR51j23nTUp+9JsCUmQIjF0RHPcJJ6nKVOPDRh6zSphYhWMIfyn
    3sMyoyIQp0Y3aN1JLOo8JAyl8uf4TVjDW7DqwPsqqsA3Jgm3LT0MUg1BQ4UOy6gwrUmb
    U34Yw9CbJJgehHeaWWeOwdqYai9Ij6TdaabIcgjEJiHp64tjqOloH9jTPUlXRcBGdn2y
    PqZlJvEp0o7Xyoq1YNmxhDdRJFkqDGVVdk7I2zttlKRSw7T223WjPQVvT6x1XwMUTS5Y
    1ncry4mlwMTcXGyjenewUgGem77zasyPCd7pwAnnPORHXzzZNUM/KEkLo/vzsgQZ4fNZ
    RoKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1749577863;
    s=strato-dkim-0003; d=digital-rabbithole.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=T2PpY0dp2d26i0PM2jP2+bIGOYl2S7wQGnslfG3nP08=;
    b=yRB0LLxRR/7v7bkoTQfV377Ibc7oWuJOPQvzTDbDADFdDHI+r4qB9AZ21VOB1OSPYQ
    AFgBeETBmq/3z4pGKRCw==
X-RZG-AUTH: ":IHkHbA68c+1zn2gb8+6dxsBP09h2Do/Zi4V+rbxtNBl2hCipBO6GPyNXZ6xAUEuHlZnKbp4UbhpDgteKQ1Dc5rYYRejjsEqb4WrQK85vHAG31zgy+09F"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id Y1c6d815AHp32d1
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 10 Jun 2025 19:51:03 +0200 (CEST)
From: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
To: tiwai@suse.de
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	lkp@intel.com,
	Lucy Thrun <lucy.thrun@digital-rabbithole.de>
Subject: [PATCH v2 1/2] ALSA: hda/ca0132: Fix using plain integer as NULL pointer in add_tuning_control
Date: Tue, 10 Jun 2025 19:50:11 +0200
Message-ID: <20250610175012.918-2-lucy.thrun@digital-rabbithole.de>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20250610175012.918-1-lucy.thrun@digital-rabbithole.de>
References: <20250610175012.918-1-lucy.thrun@digital-rabbithole.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The 'add_tuning_control' function initializes two pointers using the integer 0 instead of the NULL pointer, triggering sparse warnings.
Replaced both instaces of '0' with 'NULL' to resolve the type mismatch and suppress the sparse warnings.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506100842.d8lwwdwU-lkp@intel.com/

Signed-off-by: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
---
 sound/pci/hda/patch_ca0132.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index cfe422a79703..491d45d652dd 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -4385,8 +4385,8 @@ static int add_tuning_control(struct hda_codec *codec,
 
 	knew.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
 			SNDRV_CTL_ELEM_ACCESS_TLV_READ;
-	knew.tlv.c = 0;
-	knew.tlv.p = 0;
+	knew.tlv.c = NULL;
+	knew.tlv.p = NULL;
 	switch (pnid) {
 	case VOICE_FOCUS:
 		knew.info = voice_focus_ctl_info;
-- 
2.45.1.windows.1

