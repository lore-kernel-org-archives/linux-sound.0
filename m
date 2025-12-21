Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B590F231845;
	Sun, 21 Dec 2025 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766317824; cv=none; b=FQEbIomvQXWOIllbCwdq/mgpsrxRM8Hp5cKSFUoX1NAs+YBJrbC2QvVk/m9LAxW7pQ0dk0TAvuAR3jfZNgWVbgK/Qth1b4prqsNM37QOX5gwq2v7LaJB22tLnpu2dxmq7HHr5Isjmxwjr9/c1KaaSggXCPlpc2epN9Xu6wxAbck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766317824; c=relaxed/simple;
	bh=NJuGcgmI9AFqkVh96sWwH3BvXGoRbjJ5NN1a/RV/0zg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bCRIUC/F9HW//vlSbRXwxSA0Ffqh7pZPYgF55eliGyaD5En1We39pekU/BvEMgXnp8x5tPB7KaUMWfFFJiNAATz6kz/ieAL6/+qzTA9n20pKWeE6VqK5jc+l9Ii+4sXBU/t/BmNBrD46nEOf4flIL92ZgUJuaFgLmSAjwdMcfmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.209])
	by APP-05 (Coremail) with SMTP id zQCowABH2g3p3kdptE5sAQ--.34171S2;
	Sun, 21 Dec 2025 19:50:02 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH] soundwire: bus: fix missing error handling in sdw_bus_master_add()
Date: Sun, 21 Dec 2025 19:49:57 +0800
Message-Id: <20251221114957.945463-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABH2g3p3kdptE5sAQ--.34171S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4rAr18Jr4UAw4rGw17Jrb_yoW8Kr1Upa
	18Ga95KrW8tr1fuwn0ya10vwnYq3yIqay8ArWxGwnakr47trWFqr1jgFy0qFy3Krn5Ca1U
	Ar4aq3yjkFy5WF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r1j6r
	4UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUehL0UUUUU
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiCQ4CE2lGuxxfkgABsS

sdw_bus_master_add() lacks proper error handling, which may
lead to resource leakage. Fix this by adding corresponding
error handling operations.

Found by code review and compiled on ubuntu 20.04.

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/soundwire/bus.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fb68738dfb9b..0fb6ca164786 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -62,18 +62,20 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 	if (ret < 0) {
 		dev_err(parent, "Failed to add master device at link %d\n",
 			bus->link_id);
-		return ret;
+		goto free_ida;
 	}
 
 	if (!bus->ops) {
 		dev_err(bus->dev, "SoundWire Bus ops are not set\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto del_master_dev;
 	}
 
 	if (!bus->compute_params) {
 		dev_err(bus->dev,
 			"Bandwidth allocation not configured, compute_params no set\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto del_master_dev;
 	}
 
 	/*
@@ -99,7 +101,7 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 		if (ret < 0) {
 			dev_err(bus->dev,
 				"Bus read properties failed:%d\n", ret);
-			return ret;
+			goto unregister_key;
 		}
 	}
 
@@ -126,7 +128,7 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 
 	ret = sdw_irq_create(bus, fwnode);
 	if (ret)
-		return ret;
+		goto exit_debugfs;
 
 	/*
 	 * SDW is an enumerable bus, but devices can be powered off. So,
@@ -144,8 +146,7 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 
 	if (ret < 0) {
 		dev_err(bus->dev, "Finding slaves failed:%d\n", ret);
-		sdw_irq_delete(bus);
-		return ret;
+		goto delete_irq;
 	}
 
 	/*
@@ -164,6 +165,19 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 	bus->params.next_bank = SDW_BANK1;
 
 	return 0;
+
+delete_irq:
+	sdw_irq_delete(bus);
+exit_debugfs:
+	sdw_bus_debugfs_exit(bus);
+unregister_key:
+	lockdep_unregister_key(&bus->bus_lock_key);
+	lockdep_unregister_key(&bus->msg_lock_key);
+del_master_dev:
+	sdw_master_device_del(bus);
+free_ida:
+	ida_free(&sdw_bus_ida, bus->id);
+	return ret;
 }
 EXPORT_SYMBOL(sdw_bus_master_add);
 
-- 
2.25.1

