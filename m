Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1B2336895;
	Fri,  3 Apr 2026 07:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775202916; cv=none; b=Oerdm3TkXWsTzzCRFA8I0XOY6xGTWUQSs1tH7YnuGVY2DYhfFgJpxmu693BNhleyLImG1Xma4N5lJmek6qbujvq3aOe+5L+YFetK3rNUJbQw5ePCMokmV6kHY4Vcqb0aKCSS4wW0iyXfeqRW/NXdN7Aq/ct7wHLSbog2tDUSooI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775202916; c=relaxed/simple;
	bh=VEtcde3sOr8JwTyesiwbN+OcA7Tk0q0s9OFxqzRuUEM=;
	h=From:Date:Message-ID:To:Cc:Subject; b=FcnjOp3Ys6Sm61pSjRs0MYbUn8L8dhQ9LExoBRBC3oZhjrv80mzB4UBYuqTnb4G3FJUBE4THaL3x3Dw6fOMDAs8QBrZXcrJ7AtxnCzeMeiU0bGppVjx6yP9lwMXXJ+mmhPg06aEMxmp5uVOt29DHGB/VnsqQ5Z1tn6nOyuJlm4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0001-slimbus.eml (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowADX9dxecs9pa6O9DA--.57185S2;
	Fri, 03 Apr 2026 15:55:10 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 14:55:04 +0800
Message-ID: <20260403183503.3-slimbus-compatible-pengpeng@iscas.ac.cn>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH] slimbus: validate DT compatible before parsing it
X-CM-TRANSID:rQCowADX9dxecs9pa6O9DA--.57185S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw1DWF13Jry3JF47ZryUGFg_yoWDuwc_ur
	Z3ZF9rJrZ8Cwsakr43Zr45Zr9Yvr4q9r48Zws7t3W5KryDZrn5XFykZrn8G3y3Zr4v9FWa
	kw4qyr4FyFn5CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbw8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8
	Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU-J5rUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

`of_register_slim_devices()` fetches raw `"compatible"` bytes with
`of_get_property()` and then immediately parses them with
`sscanf("slim%x,%x", ...)`.

Live-tree OF properties are stored as raw bytes plus a separate length;
they are not globally guaranteed to be NUL-terminated. Validate the
first compatible string before parsing it.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

---
 drivers/slimbus/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index ee6318e247d3..d88b397ea81f 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -209,8 +209,8 @@ static void of_register_slim_devices(struct slim_controller *ctrl)
 		int reg[2], ret;
 		int manf_id, prod_code;
 
-		compat = of_get_property(node, "compatible", NULL);
-		if (!compat)
+		ret = of_property_read_string(node, "compatible", &compat);
+		if (ret)
 			continue;
 
 		ret = sscanf(compat, "slim%x,%x", &manf_id, &prod_code);
-- 
2.50.1 (Apple Git-155)

