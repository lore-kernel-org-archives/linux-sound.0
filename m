Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88F1330B15;
	Mon, 22 Jun 2026 15:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141143; cv=none; b=gVkKbnyfFjArorK1t00opUAskwHlyaPiP1v4G0FsshfsHVhr4scAjcxPm5Zgg22bIFAXCDeDvpjw0XWR4wTAyQmTO5EErhdIdqGY/4jhKu5xmigwXjLqUMvLbqZwdGBngGhtrWeUGFL9DoUNGrxmEvriq0/yaoBZcxxMu6prEIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141143; c=relaxed/simple;
	bh=vwW/6Le1iJJsusgPAcy96KekC+FICDnNKyqXle4W/E8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MVao6aTtPOhFCbcrJzLCE7HbSc3L6NEFzgfvkknilvayi3oalcJ2kTxZ4Ngyia5W0F/p9iFAGCxf/3vsSacH5QnE6V5furs01zW186FSShOQmWJI4SqjR+pOMg4EyaOeNMcsyba/no1wZapN8x6Zdtw7OU+lTpV1FKzyR4x2R/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iWgh+Owu; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iWgh+Owu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2c
	gwrJ0au7xqaT1wRLfTUij7KP9gI/JIQTkKiF7V2cI=; b=iWgh+Owuxb6mHzhCzt
	cax9sHt+TsaQpiDto3GiY5PNeSD54yA6r5kuAn7RIV7bPnOQxsBZQI5llbA4NGlt
	Zy3Frde7WriQt+fsKstOqP4+GMVLZvx70b/IxAGP2Ufn3VHRgvloO7Q0woMhVyVu
	RjSTGZo9H0eHXDhkNDtrbEy7M=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wAX35mgUDlqA3srEg--.249S2;
	Mon, 22 Jun 2026 23:11:29 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	sammiee5311@gmail.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] ASoC: hdac_hdmi: Fix resource cleanup on probe failure
Date: Mon, 22 Jun 2026 23:11:27 +0800
Message-Id: <20260622151127.1198196-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAX35mgUDlqA3srEg--.249S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur4kury5Zr47Gw48Xr43ZFb_yoW8uw4rpa
	95WF4YkF9xtr1IyFWDA3WxuF1IvF4xW3WfZFy2qw13Aw15ZryrJr18KrWFgF4rArWv9F4a
	qay7tayUZw4UJFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piLL0UUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7QElk2o5UKFfqQAA3O

hdac_hdmi_dev_probe() gets the HDA link before allocating and
initializing the HDMI codec private data. Several later error
paths return directly without dropping the link reference,
leaving the hlink refcount unbalanced.

Release the link reference on probe failures. Also turn display
power off if the failure happens after it has been enabled.

This issue was dicussed in:
https://lore.kernel.org/all/s5h1s0esk8o.wl-tiwai@suse.de/
I think the paths fixed here are probe failure paths: the device
has not been fully initialized or bound, and runtime PM suspend
cannot be relied on to balance the reference taken during probe.

Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 sound/soc/codecs/hdac_hdmi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 3220f9226e0b..38073a70fa61 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -1866,8 +1866,10 @@ static int hdac_hdmi_dev_probe(struct hdac_device *hdev)
 	snd_hdac_ext_bus_link_get(hdev->bus, hlink);
 
 	hdmi_priv = devm_kzalloc(&hdev->dev, sizeof(*hdmi_priv), GFP_KERNEL);
-	if (hdmi_priv == NULL)
+	if (hdmi_priv == NULL) {
+		snd_hdac_ext_bus_link_put(hdev->bus, hlink);
 		return -ENOMEM;
+	}
 
 	snd_hdac_register_chmap_ops(hdev, &hdmi_priv->chmap);
 	hdmi_priv->chmap.ops.get_chmap = hdac_hdmi_get_chmap;
@@ -1876,8 +1878,10 @@ static int hdac_hdmi_dev_probe(struct hdac_device *hdev)
 	hdmi_priv->chmap.ops.get_spk_alloc = hdac_hdmi_get_spk_alloc;
 	hdmi_priv->hdev = hdev;
 
-	if (!hdac_id)
+	if (!hdac_id) {
+		snd_hdac_ext_bus_link_put(hdev->bus, hlink);
 		return -ENODEV;
+	}
 
 	if (hdac_id->driver_data)
 		hdmi_priv->drv_data =
@@ -1902,6 +1906,8 @@ static int hdac_hdmi_dev_probe(struct hdac_device *hdev)
 	if (ret < 0) {
 		dev_err(&hdev->dev,
 			"Failed in parse and map nid with err: %d\n", ret);
+		snd_hdac_ext_bus_link_put(hdev->bus, hlink);
+		snd_hdac_display_power(hdev->bus, hdev->addr, false);
 		return ret;
 	}
 	snd_hdac_refresh_widgets(hdev);
-- 
2.25.1

