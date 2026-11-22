Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795355194;
	b=3uD5ka/6OKSbz6YF42DdJIkEXOcEoPRHTz0ybLS1WcutSYkj/RwvwnR+hJrcRPgnr1uO
	 YcQqhPvBepLOIDPG6zqGGDC+lBD2SVqaETQL0AfaYkAzB6LLEcNowRC+9F+KJRWeLv0bh
	 r8Sovllafh+EJiznDYGyTeyeDKIDeihq4EcTcK1KJm87HzWRLUPkdOUaRxqfjI3AFGTrl
	 +2CAIIIMfNqJTkZ1WF69ssM+2JRGMzKYS9Y6Qi31XlQDCypTqh0YMlUlM+Wyx/4hTG5ou
	 4bla9lRjl9t6TYJtTPU2Qxe+kltG/7sSDEgosXBCVES6ezS9MbVf8Ja9EOZpThgEfNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795355194;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=gtyCzvN8AMjKD475BbMGxJHB7AJRr0EQgHC07KjEE5Y=;
	b=eO4SrZiHDPaPlZpSuUlf6afFV2UFJQQZDTWmQMmofmZ/b2rVHzdNKtCqmgeV5Lwt6cpS
	 gB+mMpIw2Fo7dXJ7mF8GofkarZwCzmOJPHCSJCdjLUbC79rTKsiJa/YX1Rmb79VCFEu2J
	 ad/olfVKu9fKP+wh8qB5cUCZJV0HRPms1N+N5o6zRKvYtT/w//w80EvPjgdvqtrFk9L7s
	 AGf9TG+ZbzMj77JvRXC+2Gk5CTpWleyfTWrpSgjwHisBF+M4h1udYJ5bRhUTBIzMpOUAk
	 TcAb71BkgGWwfh6K8FlhHLmIKl2r8z6M3WOQXa29Zda20pivH2jSdOFWvNrkYZz+UoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SehhOicX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD841606A330;
	Sun, 22 Nov 2026 13:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SehhOicX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795355194;
	b=dzK57ej53HiorDJRWd6gpDIQkxrCw+rve0o/kX3RPw31JZOIzkrWWaF5MEMkcPaDdikp
	 1RVFkcY2oOrsGIFz++NLOknYhM7f6Z9x/zlnEfDBVD4I6prUNZRfAunfFplL3xERaikJ/
	 BUkCeauxMaZfagKEAn6u8OqvN20cfznlwDb3OgTiFaZY045ZKd0xlTAP0G6uapUuv3ZRK
	 rjiAZw9rbbFDQXbQVmZHx/0TZ0xiztgwG2MROCsp4lL6qrM44XbsNRg+FDD4e5eyq1cPi
	 hrKHaLELHCY/n4pI/i/psqAKt7o3qAdSfgGqJZJG2LLjR+dm8yXjj/uhUnLdeWpf0Sg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795355194;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=gtyCzvN8AMjKD475BbMGxJHB7AJRr0EQgHC07KjEE5Y=;
	b=BXb+ffZmOXT8k4mYQEXXTykD89VgX9/poJYKgSpvnIMyrjEGs2095STODbdHchmgjcTQ
	 RZKY20jIEc1NnlnPHWCvnPm9DLS7ZaAMYPPBhKAQQG7nJEiqK8kuC3CjTBtCOKvYymoZR
	 Ka6Qf1crorB2cLTmvKRW3i88z4QO4fVUpReOnx2i3M/1ZFZw/7vSlz2tVvc1N/2DsaOr3
	 7SdZWia2QtaAOVVMrH5xa6vvwPW09IubA1+GiuYAiLSRnXytfI3NUfR3N5IxQU2sTPuIC
	 Tis3cBLDWzhShQ83ear9Py3MbQpvb1diwEzmHFbFfuIy/WeftypT74l4lQ8g/6/jomQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B50C1F000C4;
	Sun, 22 Nov 2026 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795355193;
	bh=gtyCzvN8AMjKD475BbMGxJHB7AJRr0EQgHC07KjEE5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SehhOicXakQs0JiHLIp5z+HIafqSnsAMDN+s5znGDyzw74nyekxzofNTGp7O1IbJG
	 PIqPzCZSEi671l5oKTfCygSMbezQEsQuUxJADkoWnOVvR2A4A8smYGZwYJw5R17jNK
	 YOcP88sqSI5Xl2CnSRuzUd9Gs+vKVhaYrtT/cNx5iszZKU2nvXKOjuLioSknFQ0XJc
	 AjVVBf7IU4ROQp7XZnlyviMXnUbe/lrmDVHtaWaLPyxaG+gFAMmzYWk3II2qMYkIZr
	 6yDf3Hp05Z0DpgEIyJ9pmB8+WtlZFl/5eQbexU8wDka0Ubvo7anafKr8xdwDVZkXHE
	 vTo5UszIvEHGA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B4B884C0D4;
	Sun, 22 Nov 2026 13:46:29 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 13:46:29 +0000
Subject: [PATCH v2 1/2] ALSA: firewire-lib: Abort the FCP transaction on a
 bus reset
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-firewire-busreset-v2-1-e104d785c8a1@gmail.com>
References: <20261122-firewire-busreset-v2-0-e104d785c8a1@gmail.com>
In-Reply-To: <20261122-firewire-busreset-v2-0-e104d785c8a1@gmail.com>
To: o-takashi@sakamocchi.jp, clemens@ladisch.de, tiwai@suse.com
Cc: stefanr@s5r6.in-berlin.de, linux-sound@vger.kernel.org, perex@perex.cz, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795355188; l=2101;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=6CqPPE3mEanKHilmp+S+EGLzRo0PnbexFfGZIxBreE4=;
 b=Yj/RgLnO8Z/dSCfWK46K0CN3liyIYd0tkQMUJh9vZHV/VYjNizrTQ+hZtZvNPJK3QUlAw0jaE
 aHWky6y0QI1DH6BBqNoQeCFKQNw9+SIXN76/86yDZ7iLoUCNIXIw3Dr
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

When fcp_bus_reset() marks a transaction as STATE_BUS_RESET,
fcp_avc_transaction() sleeps and resends the command, but leaves the
state as it is. The response to the resent command is then ignored, and
the next wait returns at once, so the loop keeps resending the command
without a retry limit until sending fails.

The AV/C Digital Interface Command Set General Specification 4.2 says
that a target which detects a bus reset discards any AV/C transaction
in progress without returning a response. So instead of resending, end
the transaction on a bus reset and return -EAGAIN, so that the caller
can start the sequence again. ERROR_DELAY_MS and <linux/delay.h> have no
users left after this, so drop them.

Found with a static analysis tool and checked by hand.

Suggested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Fixes: 31ef9134eb52 ("ALSA: add LaCie FireWire Speakers/Griffin FireWave Surround driver")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 sound/firewire/fcp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/fcp.c b/sound/firewire/fcp.c
index e60bfd0ee4ac..b8e7e2c90791 100644
--- a/sound/firewire/fcp.c
+++ b/sound/firewire/fcp.c
@@ -14,7 +14,6 @@
 #include <linux/sched.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
-#include <linux/delay.h>
 #include "fcp.h"
 #include "lib.h"
 #include "amdtp-stream.h"
@@ -22,7 +21,6 @@
 #define CTS_AVC 0x00
 
 #define ERROR_RETRIES	3
-#define ERROR_DELAY_MS	5
 #define FCP_TIMEOUT_MS	125
 
 int avc_general_set_sig_fmt(struct fw_unit *unit, unsigned int rate,
@@ -272,7 +270,8 @@ int fcp_avc_transaction(struct fw_unit *unit,
 			ret = t.response_size;
 			break;
 		} else if (t.state == STATE_BUS_RESET) {
-			msleep(ERROR_DELAY_MS);
+			ret = -EAGAIN;
+			break;
 		} else if (++tries >= ERROR_RETRIES) {
 			dev_err(&t.unit->device, "FCP command timed out\n");
 			ret = -EIO;

-- 
2.34.1


