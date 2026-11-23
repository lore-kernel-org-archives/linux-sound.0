Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420532;
	b=0cMJNGkRcwRlPoKXtVPMYkpZMqGutGI4tcx5ph5o0j6Pm/+LE1Zt1lsWR3koO0oySWb+
	 welkdTECh1vAb0dfPTN2HMVGY3y1QrTrUW4ZAhwYhz4Y/WnJGXIJhL9KAmIb92xhbKaSr
	 /0Qb+ME7VGOEOZ9rZXVEyaSx8aQcwADBsNWFkFmlHCXW88tZ84QmVYVRhEFuqrnlJ6rqI
	 eeBt9pJDXjCCmQWYd2ZwHhIUpD0FkzIZwTdp+WTRNbp7hyP/dtb7sMWinwRc58TIMIh8b
	 N/wYsV6yvrlXzR/tnenu8qylZQmeDFN2KGbRXv+hRZc3mExg83nspj5P3S2pHhV3wfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420532;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Js4FoDVmwbZeydt2g600qtY74Tqckgc0nauAzvTfVnU=;
	b=TBUYBpj3CWsqd207iA4qVf7oJO4dJUyXnPVrqkknV1M733p3iOOjecYpND0NsMd6zNwE
	 1Rlq8oZF2NIVlUlzk7bRQdYj36j/1O8V8h4ReSEPZRAk9jAtwPFErBEQl3Nu1clqTLW/i
	 w0HHOCoJD1VyVlL+hCiFzt7KtRNVBTSgvkF5gcsmlhxuQR0BARk+HOWACfOgxWdu8RVAs
	 eMHx84jHg79kRnYVVbhzLDm/GKD2TfRL4Fxoqe690SRxGiFCKMG3dYqHvlEUoK4peWnX6
	 4HuA3tdFs9AOtGEFPcJk9Idy2N26DMrvcK0b8oIDBBK+qF25aJKq+NGrfF2cPAyBdDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N8eMZr+v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB564606A31E;
	Mon, 23 Nov 2026 07:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N8eMZr+v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3EA1F000CF;
	Mon, 23 Nov 2026 07:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420532;
	bh=Js4FoDVmwbZeydt2g600qtY74Tqckgc0nauAzvTfVnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N8eMZr+vGUKK+O4llMNJft5RXVIvmIut2pAhL0QQLTa46intdJWMfEh2Xw1EFDFh/
	 NLhVl9XdCRrMV1jK8r/+h0YM6paE/vB7CdoX7V/CUkQ8fpjLGfwwzuoTkyfW7R5GYL
	 lN6g78VQv7Ou8SrIPC4cJARUPaPjSXtJIyi7vctTmzwGMG5oS3q21hBwrmdOf0nr7V
	 fdBdTBQtFY4BFNPFD+66RdQb/C8/G4dnAB8+bF91c4cZ6HwZFFAOoaxE0F4Q58tce4
	 FNvjXLQdL/4141SP+Y2UTWAY/A6Z8w9znXyfCx/8PTKuEz2VZaAM69QLp0G93WI6fq
	 qrNZ1+ZnAFpNA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v3 01/10] soundwire: bus: Hold bus_lock when looking up slave devices
Date: Mon, 23 Nov 2026 07:54:22 +0000
Message-ID: <20261123075522.405347-2-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261123075522.405347-1-lee@kernel.org>
References: <20261123075522.405347-1-lee@kernel.org>
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

sdw_get_slave() iterates over bus->slaves and requires bus->bus_lock to
be held by the caller.  However, sdw_handle_slave_status() and
sdw_clear_slave_status() drop bus->bus_lock immediately before calling
sdw_get_slave().  If a concurrent slave teardown unlinks the node via
list_del_init() and frees the slave while bus->bus_lock is dropped,
sdw_get_slave() can spin forever on the self-referential list entry or
dereference freed memory.

Keep bus->bus_lock held across the sdw_get_slave() lookup in
sdw_handle_slave_status() and sdw_clear_slave_status().

Closes: https://sashiko.dev/#/bug/linux-b0e65a93-dfd4-4e3d-a96c-8f13ba0aafd2
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: HyeongJun An <sammiee5311@gmail.com>
Signed-off-by: Lee Jones <lee@kernel.org>
---

v2 => v3:
 - Collect Reviewed-by and Tested-by tags (Charles, HyeongJun)

v1 => v2:
 - Drop Fixes and Stable tags

 drivers/soundwire/bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index aeaae5a57c89..15c66effbf4f 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1907,9 +1907,9 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			mutex_unlock(&bus->bus_lock);
 			continue;
 		}
-		mutex_unlock(&bus->bus_lock);
 
 		slave = sdw_get_slave(bus, i);
+		mutex_unlock(&bus->bus_lock);
 		if (!slave)
 			continue;
 
@@ -1954,9 +1954,9 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			mutex_unlock(&bus->bus_lock);
 			continue;
 		}
-		mutex_unlock(&bus->bus_lock);
 
 		slave = sdw_get_slave(bus, i);
+		mutex_unlock(&bus->bus_lock);
 		if (!slave)
 			continue;
 
@@ -2052,9 +2052,9 @@ void sdw_clear_slave_status(struct sdw_bus *bus, u32 request)
 			mutex_unlock(&bus->bus_lock);
 			continue;
 		}
-		mutex_unlock(&bus->bus_lock);
 
 		slave = sdw_get_slave(bus, i);
+		mutex_unlock(&bus->bus_lock);
 		if (!slave)
 			continue;
 
-- 
2.56.1.750.gf70dc682cf-goog

