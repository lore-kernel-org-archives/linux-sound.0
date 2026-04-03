Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1990131A576;
	Fri,  3 Apr 2026 07:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775202921; cv=none; b=j5KR4QXSv4V9uP8evHEetbLrDtodzmW43Xy2ur5qBV+G6x0IGLc7F0ZClVCXmiy2yyC6wNojPpUtvTLr/NLGaUPB5aISAZyGrn9gKRbqsfr6wuWh5LivDRvc1JrFyVBi0VchMnwf6MlrZIz4wQh1vYXdddv/xb+a7UD+9DjfojE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775202921; c=relaxed/simple;
	bh=OrNDk90Og4bHjIKxxnEaCXtBKHzN7zeYeaQCJXLHnm4=;
	h=From:Date:Message-ID:To:Cc:Subject; b=QByBFqeaS0Qkm3/S4Bb9dH+8/5AsYv3osn3drfETPJF8Kp/ISuUI85ODreIoYor3JkS5dxihdvqfzcphzwqKNWDBPt6125PrPrWgPGSm5zrm8edKTiodMVY4d+m/TeuVqjrOzzhjndYkTFapjEtGe2WSFgqz89zdOpFhIBvcTwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0002-soundwire.eml (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowAD3E9tfcs9pbqO9DA--.11784S2;
	Fri, 03 Apr 2026 15:55:11 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 14:55:12 +0800
Message-ID: <20260403183504.4-soundwire-compatible-pengpeng@iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH] soundwire: validate DT compatible before parsing it
X-CM-TRANSID:rQCowAD3E9tfcs9pbqO9DA--.11784S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw1DWF15trWxtrW7Jr47urg_yoWDtwcEk3
	97X3W7GFWakws7tr12vr4ay3yvyFs09wn7Xw4ktF45Gr1DZr43J34kZrn3Jw15GrW8uFya
	93yayw4rAFs5CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbckFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUIfO7UUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

`sdw_of_find_slaves()` fetches raw `"compatible"` bytes with
`of_get_property()` and then immediately parses them with
`sscanf("sdw%01x%04hx%04hx%02hhx", ...)`.

Live-tree OF properties are stored as raw bytes plus a separate length;
they are not globally guaranteed to be NUL-terminated. Validate the
first compatible string before parsing it.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

---
 drivers/soundwire/slave.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index f5a3ca3b9dda..025cb138ef6f 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -241,8 +241,8 @@ int sdw_of_find_slaves(struct sdw_bus *bus)
 		struct sdw_slave_id id;
 		const __be32 *addr;
 
-		compat = of_get_property(node, "compatible", NULL);
-		if (!compat)
+		ret = of_property_read_string(node, "compatible", &compat);
+		if (ret)
 			continue;
 
 		ret = sscanf(compat, "sdw%01x%04hx%04hx%02hhx", &sdw_version,
-- 
2.50.1 (Apple Git-155)

