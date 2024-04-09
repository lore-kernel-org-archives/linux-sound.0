Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837841EA74
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 08:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712651912; cv=none; b=C5OiGrg3HxOX/VrbTPReP9Ip2eBn3ur+w1ZNFEBq4UTyTVLzVkY525jJp4m7tuf/jpNPiTMJyn/aOfkSbPVr/NiVc0+jmNU3yGcoM5eUsH+zELdLLgW1OYRR6R6PIRCf1UUERHpwT3EGHenMi/jtgj6BaWzDuL+BdCY6PGKDLAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712651912; c=relaxed/simple;
	bh=WKKnBKARQcLvD04J395njQPw7dOoY9pmYkvB35Z3mAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8P2Wl9sN+bguKsnYbF9Xqzl3s9cvCD20BSbJw3733Y7XT6FugXcTEZNduLGcaiHnE9B/6ruZxqwKmACpUjMieAu3UikL5tR6l+JdP+7OuvnPtvyR6Gn6IesKxGXSJnPOUXwwJ7GFiWFU5/poJ2qaPjfTG4IopSXn72IXMSFqCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObO/Sn8I; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObO/Sn8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712651911; x=1744187911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WKKnBKARQcLvD04J395njQPw7dOoY9pmYkvB35Z3mAM=;
  b=ObO/Sn8ISNrJWQg9KayJgdJa5bnj+cnBXP+UFmkcW1iutMBFQeUCioud
   VOVcio/noCP1OWY4Py7+22U5HBNDppEMWS6IMsy4dtbOdvIm9YswmZSNA
   DTvdFAzRshTbRgRgfjj9GfSUTmY8z/dSZhOCbVEcv9naHaHiqIsqH/IYj
   Aa7aKTBJnkjs+eI8XDGQ0IiVTtYwtk0FERDyMWK5YwAeZSsi9FcyPvFy6
   S6LjH6OTZYLrC/IGiqfCIvp+i5KJbGIMgYNZ/fE+eRc4hSOSZBKUW7NHx
   5QdzEKfjA4zxMhgXdrGFC3V8E15xYA59YE7hRlcHP3A7Lcly0IMYLNkLY
   Q==;
X-CSE-ConnectionGUID: GBvtgJ+TTzCY5CDwhSVyXA==
X-CSE-MsgGUID: M+1MEYDdSyOG36HdjmR0pg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19108950"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="19108950"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:38:31 -0700
X-CSE-ConnectionGUID: K2VjhXL2T7KbB3I2Az8yjQ==
X-CSE-MsgGUID: uZEk5cqKQ5y/YZ8bzHJNDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20189862"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.59.81])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:38:21 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	liam.r.girdwood@intel.com,
	ranjani.sridharan@linux.intel.com,
	perex@perex.cz
Subject: [PATCH 2/5] ALSA: hda: hdac_controller: Implement support for use_pio_for_commands mode
Date: Tue,  9 Apr 2024 11:38:09 +0300
Message-ID: <20240409083812.14001-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409083812.14001-1-peter.ujfalusi@linux.intel.com>
References: <20240409083812.14001-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case the use_pio_for_commands flag is set we must not enable the
CORB DMA to make sure that it is not interfering with the immediate
command mode.

Convert the snd_hdac_bus_send_cmd/snd_hdac_bus_get_response as wrappers to
call either the PIO or CORB based command handling depending on the
use_pio_for_commands flag.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/hda/hdac_controller.c | 127 ++++++++++++++++++++++++++++++++++--
 1 file changed, 120 insertions(+), 7 deletions(-)

diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index 7f3a000fab0c..b5c833b9f8b9 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -62,7 +62,8 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
 		azx_clear_corbrp(bus);
 
 	/* enable corb dma */
-	snd_hdac_chip_writeb(bus, CORBCTL, AZX_CORBCTL_RUN);
+	if (!bus->use_pio_for_commands)
+		snd_hdac_chip_writeb(bus, CORBCTL, AZX_CORBCTL_RUN);
 
 	/* RIRB set up */
 	bus->rirb.addr = bus->rb.addr + 2048;
@@ -135,14 +136,94 @@ static unsigned int azx_command_addr(u32 cmd)
 	return addr;
 }
 
+/* receive an Immediate Response with PIO */
+static int snd_hdac_bus_wait_for_pio_response(struct hdac_bus *bus,
+					      unsigned int addr)
+{
+	int timeout = 50;
+
+	while (timeout--) {
+		/* check IRV bit */
+		if (snd_hdac_chip_readw(bus, IRS) & AZX_IRS_VALID) {
+			/* reuse rirb.res as the response return value */
+			bus->rirb.res[addr] = snd_hdac_chip_readl(bus, IR);
+			return 0;
+		}
+		udelay(1);
+	}
+
+	dev_dbg_ratelimited(bus->dev, "get_response_pio timeout: IRS=%#x\n",
+			    snd_hdac_chip_readw(bus, IRS));
+
+	bus->rirb.res[addr] = -1;
+
+	return -EIO;
+}
+
 /**
- * snd_hdac_bus_send_cmd - send a command verb via CORB
+ * snd_hdac_bus_send_cmd_pio - send a command verb via Immediate Command
  * @bus: HD-audio core bus
  * @val: encoded verb value to send
  *
  * Returns zero for success or a negative error code.
  */
-int snd_hdac_bus_send_cmd(struct hdac_bus *bus, unsigned int val)
+static int snd_hdac_bus_send_cmd_pio(struct hdac_bus *bus, unsigned int val)
+{
+	unsigned int addr = azx_command_addr(val);
+	int timeout = 50;
+	int ret = -EIO;
+
+	spin_lock_irq(&bus->reg_lock);
+
+	while (timeout--) {
+		/* check ICB bit */
+		if (!((snd_hdac_chip_readw(bus, IRS) & AZX_IRS_BUSY))) {
+			/* Clear IRV bit */
+			snd_hdac_chip_updatew(bus, IRS, AZX_IRS_VALID, AZX_IRS_VALID);
+			snd_hdac_chip_writel(bus, IC, val);
+			/* Set ICB bit */
+			snd_hdac_chip_updatew(bus, IRS, AZX_IRS_BUSY, AZX_IRS_BUSY);
+
+			ret = snd_hdac_bus_wait_for_pio_response(bus, addr);
+			goto out;
+		}
+		udelay(1);
+	}
+
+	dev_dbg_ratelimited(bus->dev, "send_cmd_pio timeout: IRS=%#x, val=%#x\n",
+			    snd_hdac_chip_readw(bus, IRS), val);
+
+out:
+	spin_unlock_irq(&bus->reg_lock);
+
+	return ret;
+}
+
+/**
+ * snd_hdac_bus_get_response_pio - receive a response via Immediate Response
+ * @bus: HD-audio core bus
+ * @addr: codec address
+ * @res: pointer to store the value, NULL when not needed
+ *
+ * Returns zero if a value is read, or a negative error code.
+ */
+static int snd_hdac_bus_get_response_pio(struct hdac_bus *bus,
+					 unsigned int addr, unsigned int *res)
+{
+	if (res)
+		*res = bus->rirb.res[addr];
+
+	return 0;
+}
+
+/**
+ * snd_hdac_bus_send_cmd_corb - send a command verb via CORB
+ * @bus: HD-audio core bus
+ * @val: encoded verb value to send
+ *
+ * Returns zero for success or a negative error code.
+ */
+static int snd_hdac_bus_send_cmd_corb(struct hdac_bus *bus, unsigned int val)
 {
 	unsigned int addr = azx_command_addr(val);
 	unsigned int wp, rp;
@@ -176,7 +257,6 @@ int snd_hdac_bus_send_cmd(struct hdac_bus *bus, unsigned int val)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_hdac_bus_send_cmd);
 
 #define AZX_RIRB_EX_UNSOL_EV	(1<<4)
 
@@ -234,15 +314,15 @@ void snd_hdac_bus_update_rirb(struct hdac_bus *bus)
 EXPORT_SYMBOL_GPL(snd_hdac_bus_update_rirb);
 
 /**
- * snd_hdac_bus_get_response - receive a response via RIRB
+ * snd_hdac_bus_get_response_rirb - receive a response via RIRB
  * @bus: HD-audio core bus
  * @addr: codec address
  * @res: pointer to store the value, NULL when not needed
  *
  * Returns zero if a value is read, or a negative error code.
  */
-int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
-			      unsigned int *res)
+static int snd_hdac_bus_get_response_rirb(struct hdac_bus *bus,
+					  unsigned int addr, unsigned int *res)
 {
 	unsigned long timeout;
 	unsigned long loopcounter;
@@ -293,6 +373,39 @@ int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
 
 	return -EIO;
 }
+
+/**
+ * snd_hdac_bus_send_cmd - send a command verb via CORB or PIO
+ * @bus: HD-audio core bus
+ * @val: encoded verb value to send
+ *
+ * Returns zero for success or a negative error code.
+ */
+int snd_hdac_bus_send_cmd(struct hdac_bus *bus, unsigned int val)
+{
+	if (bus->use_pio_for_commands)
+		return snd_hdac_bus_send_cmd_pio(bus, val);
+
+	return snd_hdac_bus_send_cmd_corb(bus, val);
+}
+EXPORT_SYMBOL_GPL(snd_hdac_bus_send_cmd);
+
+/**
+ * snd_hdac_bus_get_response - receive a response via RIRB or PIO
+ * @bus: HD-audio core bus
+ * @addr: codec address
+ * @res: pointer to store the value, NULL when not needed
+ *
+ * Returns zero if a value is read, or a negative error code.
+ */
+int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
+			      unsigned int *res)
+{
+	if (bus->use_pio_for_commands)
+		return snd_hdac_bus_get_response_pio(bus, addr, res);
+
+	return snd_hdac_bus_get_response_rirb(bus, addr, res);
+}
 EXPORT_SYMBOL_GPL(snd_hdac_bus_get_response);
 
 #define HDAC_MAX_CAPS 10
-- 
2.44.0

