Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571416;
	b=rVupLicuBtWkY8HbEf0lTS3C3PTSpxzFLe+Z9ANf+3qxFlC1U+rDay/tAJ2a/m/LD7gV
	 KouAK2pHkQyNvoiFr7jXq5K74Pi3zx6uOH/C68+wPYuNybEaoqtJJY+jfjYSvigqxnZsh
	 MyTEa/rmdagrBBb4yb1cL35PMO5VjRSBcRVBH264+LFinrYZm4siP8ddEgI83ogTo8ECB
	 gYAIMudnl5HH7U+OZe8iHs+KQYNieDS51JhhBF86CXzlDInq8g/1eQgGNFN62pYLmnLQk
	 T8brlGow74HZsMQ/4s+QJ5Ne5sBV+/z9TxyrUH3sMOn5tFUcGnfilcaH7BWwEK5U3xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571416;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q4OiNOvsFYj3S101/WhQpAZTxu5C23jYLW3KNm88V08=;
	b=Iaokrb7LkT9pMHI593HQgNBL1nCaf7Xo4TRa3qMkAij4iVXsezFMZ4sgs392LaRt7fhV
	 W6cjjdYt6bnsJZAJ5mX5q6v2TYf4MNUA7eNoO4IOJnXU0WvULIhUmSanZE0TjigY1Etk4
	 AyV9oj7b9YQfuH3GO0TqIeyX20EHGmgb+gbctZrgkhZdVcEajPanVx+ZHSo/8pBuID1zJ
	 qNzVB7PqxnZGoUGXZ3/kqrRISndj2qDD8BUepsdinv/UqUN5CnJaIq9V55DS9/2Qlyfgl
	 80MD4ATLTWOg6ksNeLdPGNyAJz3JLpvin98DXEoWGkZ0mw/2aOuTq5J9uMFWE5Dmg+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vyhCfpB5;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53327606A327;
	Wed, 25 Nov 2026 01:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53327606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vyhCfpB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=vyhCfpB5/Snc9fl1F+tjtfEiHZ1W2uqp/Wmvc/Qb+ka9yQXLKTak+rFEU6GBgoFoVORUX777bIPm8
	 iRFezbUU6VlNH3VZOikPYPkorPNLlLlpB8vzKe9N7mD3zpefMTY9Si6dxN0sfmmxM03TZnRuCPc8u7
	 mw9rVyTdd+4iEDYI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16b063ecf1e9-2801b;
	Wed, 25 Nov 2026 09:50:07 +0800 (CST)
X-RM-TRANSID:2ee16b063ecf1e9-2801b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76b063ecdbb1-33fd2;
	Wed, 25 Nov 2026 09:50:07 +0800 (CST)
X-RM-TRANSID:2ee76b063ecdbb1-33fd2
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@intel.com,
	pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v3] soundwire: mipi_disco: Put fwnode on property array read errors
Date: Wed, 25 Nov 2026 09:50:05 +0800
Message-ID: <20261125015005.1528-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sdw_master_read_prop() and sdw_slave_read_dpn() take a fwnode
reference with device_get_named_child_node() and already release it
on the -ENOMEM and success paths.  However, the error paths added
for the property array reads jump straight out without dropping the
reference, leaking it on every failed read.  The lane-list support
in sdw_slave_read_dpn() is even missing the put on its -ENOMEM path,
unlike the other array allocations in the same function.

Release the reference on those error paths as well, matching the
existing -ENOMEM handling in the same functions.

Fixes: a489afc105ed ("soundwire: mipi-disco: add error handling for property array read")
Fixes: 71b405b18444 ("soundwire: mipi-disco: add support for DP0/DPn 'lane-list' property")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
Changes in v3:

- Rebase on the current code as requested by Vinod: adapt the
  lane-list hunk context to devm_kzalloc_objs(), following the
  treewide conversion to the devm_kmalloc_obj() family (4dd10fbbeb9c).
  No functional change.

Link: https://lore.kernel.org/all/20261112060943.1916-1-laixiangwu@cmss.chinamobile.com
 drivers/soundwire/mipi_disco.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index 8110a5399..256aa496d 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -95,8 +95,10 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 		ret = fwnode_property_read_u32_array(link,
 				"mipi-sdw-clock-frequencies-supported",
 				prop->clk_freq, prop->num_clk_freq);
-		if (ret < 0)
+		if (ret < 0) {
+			fwnode_handle_put(link);
 			return ret;
+		}
 	}
 
 	/*
@@ -130,8 +132,10 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 					       scales_prop,
 					       prop->clk_gears,
 					       prop->num_clk_gears);
-		if (ret < 0)
+		if (ret < 0) {
+			fwnode_handle_put(link);
 			return ret;
+		}
 	}
 
 	fwnode_property_read_u32(link, "mipi-sdw-default-frame-rate",
@@ -257,8 +261,10 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 			ret = fwnode_property_read_u32_array(node,
 					"mipi-sdw-port-wordlength-configs",
 					dpn[i].words, dpn[i].num_words);
-			if (ret < 0)
+			if (ret < 0) {
+				fwnode_handle_put(node);
 				return ret;
+			}
 		}
 
 		fwnode_property_read_u32(node, "mipi-sdw-data-port-type",
@@ -299,8 +305,10 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 			ret = fwnode_property_read_u32_array(node,
 					"mipi-sdw-channel-number-list",
 					dpn[i].channels, dpn[i].num_channels);
-			if (ret < 0)
+			if (ret < 0) {
+				fwnode_handle_put(node);
 				return ret;
+			}
 		}
 
 		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-combination-list");
@@ -318,8 +326,10 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 					"mipi-sdw-channel-combination-list",
 					dpn[i].ch_combinations,
 					dpn[i].num_ch_combinations);
-			if (ret < 0)
+			if (ret < 0) {
+				fwnode_handle_put(node);
 				return ret;
+			}
 		}
 
 		fwnode_property_read_u32(node,
@@ -340,14 +350,18 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 			dpn[i].lane_list = devm_kzalloc_objs(&slave->dev,
 							     *dpn[i].lane_list,
 							     dpn[i].num_lanes);
-			if (!dpn[i].lane_list)
+			if (!dpn[i].lane_list) {
+				fwnode_handle_put(node);
 				return -ENOMEM;
+			}
 
 			ret = fwnode_property_read_u32_array(node,
 						       "mipi-sdw-lane-list",
 						       dpn[i].lane_list, dpn[i].num_lanes);
-			if (ret < 0)
+			if (ret < 0) {
+				fwnode_handle_put(node);
 				return ret;
+			}
 		}
 
 		fwnode_handle_put(node);
-- 
2.50.1.windows.1



