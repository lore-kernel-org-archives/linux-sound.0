Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795355201;
	b=YhUW+/PxSrmRMM6Jl2RlDo6qHYupVEjTKmH9hdwT5MvUhI0vNVwGGYol8qGd7bDcpLDf
	 LImFNxl/2QA/Z1316psWQTPHy/oVftGITmmIiB6kK24RD1XJ5WbZ1oenGJFIIsziASdTt
	 OHe9uZP3HV+vOve7ugGJ5XbLXopotR70ofecbR5rFuYbC6xiPKhuPXAA6LKUPHX/YFP93
	 Kd/2R3NOOHrzqMlo1w3vFBKURElM8h7x9+vdXEZo4yfBdjC/Mx0bXvwa8IaDluCkoGXmD
	 YetEKvbYG6I/Q5afkL34A8uDX3u9U0e5H0lmnbnqvcqCcgUW9ZBpfSiOkDuHUA0FUAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795355201;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=IOq0sh7TUG12wfWYomcvP/7qaSOL4zRWDT9IlKHa2mk=;
	b=j3t+1PbMS8myb/b+pfVCu//xusOKIxtgPHnkhpDaJ/6GBkZGgmEUiFHynY/z9x+SYHUH
	 r5neEISL4sqUIp+K74IMzG9D7BsoLaielSYiU2bOgkkMQed98v0ljfyBlSAYMKQPR6DIU
	 rLSKPRmPZdjhx5KC8qP6/3mG+1nVdP5+NIWPUiWDCasRRILE6QXgSIYdwsd0u/gnbHnVb
	 5AkLoDjewQaBB2bvuPddxRTDdDjEzJeAxRIS4V4JM9/Ou6sPtwZPtqupw6OyhIOz74bjV
	 EmYLD/IrIy+yoQJU90V4DGQmwkNR0BvuEdxU3/24o3uZvP9wvOapKXyiwnHNqCS7mLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irGi+cfk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91570606A32C;
	Sun, 22 Nov 2026 13:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irGi+cfk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795355201;
	b=FganSu0Ccf+kmBbXuoEbAJ2icNRSXKL8jBAy9zDmDU96DoFcWBu4pbNhwDxRWzrhqFA+
	 bu4RSQ+KzJszRTpxnXwY3MgpQPmAug1BSnH64cZRC5LF/IPox8a37fLrO4SsmgRTtvR5F
	 5KGfyGD9In6P45Q7AKFypo2o6LKVSOCMyVlcRE9utGIBzJIAhFcGXU1JfHlW/I1U+O8p0
	 lq2jpNtsWMQ+AXr2RylgYg01zRQa+X5DD7+1DFX19WVIHIOdUWX/Mok4uHFGMZd2bVvsk
	 nB1Oz1BwI8rOUlhHW+L1IgOvf3E2a+Hvn2jEBYmwgfNTSEOEz3qINHfmNcodzpd1TAw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795355201;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=IOq0sh7TUG12wfWYomcvP/7qaSOL4zRWDT9IlKHa2mk=;
	b=l+HjDgrcJU8PxQtSnzvi07a6l7GyVQ4P9MhjOw98bMO0EZm7jB51oMRrDoEAU8PR2vve
	 uFRbdo720biLjKlVXJzBzIoX6wIBkO9zgytdgr/sstO7xdKM4Tku7n8h9Yt3RPqD95MCS
	 mt0Sm9foMMkz7MdcRaPiEeR43cO3D8rO6LKC/Vm+N/LfxKwStHhSXbzOd+0UdNPQRHGgs
	 MKB1YuCc25VTk0MRgiYPm+TSA4HUe55o0tymOiv6Ledis7djnRDKijB4n5QKsS7m8eEnC
	 LORPIaK4D/BAR6Nse4oZYfuEKuhuQr/YLN8JAjxoWWAgYCDhjNLNdSgUFj7zDSHP9XQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45BCD1F000C6;
	Sun, 22 Nov 2026 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795355201;
	bh=IOq0sh7TUG12wfWYomcvP/7qaSOL4zRWDT9IlKHa2mk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=irGi+cfknVxNz04GqlCL1I649TSNkW1P8mj11TsKq+3VkgK/RYo7pri3W3Ghq/EK3
	 uPsiU+84GQlKxodpYojsW4xaVaDDkz8A81mt2FIXWbiInI4duvM2hBATO8SvUKbmKS
	 lWOYEvx7WPg5wYCpI9PkdGj0wb8dO05fxUx6UGgDJMH6aWLBS+KhlfIEwcIk/Y8YP1
	 MSBna8KqSCxa2LwNzhFEmfRMBVDGXJzmgfY99ouw1MVHCByoCA1dIdX5aLmED+SIRi
	 SLjkGB/tB1hycKS9T1zsRrquIsEWZ7KVgTIg48EfCGK9qpZuJdIYsjxGqNwYSB8c/J
	 dqlEjEgjKonng==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CFC424C0D0;
	Sun, 22 Nov 2026 13:46:29 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 13:46:30 +0000
Subject: [PATCH v2 2/2] ALSA: fireworks: Abort the transaction on a bus
 reset
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
Message-Id: <20261122-firewire-busreset-v2-2-e104d785c8a1@gmail.com>
References: <20261122-firewire-busreset-v2-0-e104d785c8a1@gmail.com>
In-Reply-To: <20261122-firewire-busreset-v2-0-e104d785c8a1@gmail.com>
To: o-takashi@sakamocchi.jp, clemens@ladisch.de, tiwai@suse.com
Cc: stefanr@s5r6.in-berlin.de, linux-sound@vger.kernel.org, perex@perex.cz, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795355188; l=1920;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=fhg9NDjaNT8GJA64KhkdJLd88zbmeEobh1mF6AYpWhI=;
 b=lUwJGdBidPNerzLa0yBkLF9tU6IAej1hLyHVFB831ArGHR82Z/pk553D0kCvPm9jsmArt+bWc
 HzaBwnmNi9VC8uG1ryjSTNMmJ+YwujOqW9kBeRvgrW/4L34hDLl3/O5
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

When snd_efw_transaction_bus_reset() marks a transaction as
STATE_BUS_RESET, snd_efw_transaction_run() sleeps and resends the
command, but leaves the state as it is. The response to the resent
command is then ignored, and the next wait returns at once, so the loop
keeps resending the command without a retry limit until sending fails.

Fireworks devices also accept AV/C commands, and the AV/C general
specification says that a bus reset discards any transaction in
progress. Do the same as for FCP: end the transaction on a bus reset and
return -EAGAIN. ERROR_DELAY_MS has no users left, so drop it.

Found with a static analysis tool and checked by hand.

Suggested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Fixes: bde8a8f23bbe ("ALSA: fireworks: Add transaction and some commands")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 sound/firewire/fireworks/fireworks_transaction.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks_transaction.c b/sound/firewire/fireworks/fireworks_transaction.c
index 5c859773fe06..bb9ab8ed52b5 100644
--- a/sound/firewire/fireworks/fireworks_transaction.c
+++ b/sound/firewire/fireworks/fireworks_transaction.c
@@ -34,7 +34,6 @@
 #define MEMORY_SPACE_EFW_RESPONSE	0xecc080000000ULL
 
 #define ERROR_RETRIES 3
-#define ERROR_DELAY_MS 5
 #define EFC_TIMEOUT_MS 125
 
 static DEFINE_SPINLOCK(instances_lock);
@@ -99,7 +98,8 @@ int snd_efw_transaction_run(struct fw_unit *unit,
 			ret = t.size;
 			break;
 		} else if (t.state == STATE_BUS_RESET) {
-			msleep(ERROR_DELAY_MS);
+			ret = -EAGAIN;
+			break;
 		} else if (++tries >= ERROR_RETRIES) {
 			dev_err(&t.unit->device, "EFW transaction timed out\n");
 			ret = -EIO;

-- 
2.34.1


