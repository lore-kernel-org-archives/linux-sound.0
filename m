Received: from MTA-08-4.privateemail.com (mta-08-4.privateemail.com [198.54.122.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D91A332EAD;
	Tue, 28 Jul 2026 17:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.122.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260177; cv=none; b=Ptg5du1K3gDr5Ql9dirWnq3ji1/BqDmYmSnXIIW3nF2+lhki11TjFll7bEsGZcJB2MQRKr+87XTMEp6QDM8AmqdUzT+LfKbgEUZv/V9zousH/bsX/z3ovJ7pYogQ98rdoITfsdMLjrErHILYfSb4LUZ4PhPs9gIE9eTUYEhpnm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260177; c=relaxed/simple;
	bh=PtU/dDLvgAqA2dfULkmT75pXzWXmrQc8jXvtBHVviGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b5l/KGig6vuFOIB5e6X9u7MSo5vPMxh/pTN5J2V5pPzA2fGUBvvdr2Q95r8hcxoorttUuGB3U6znhtgtNcnCeyDlQFshhJPLmAJCQRQQsAAqCoIYEmUnP6PubYmquLuP+z4MFTAdLbyV9ToGFObFHjsSzaFCo2D5FgqpwqJ4E34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.122.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (K8S-PROD-WORKER-04 [87.215.145.39])
	by mta-08.privateemail.com (Postfix) with ESMTPA id 4h8jLF5wG9z3hhTF;
	Tue, 28 Jul 2026 13:36:04 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] soundwire: honor clock_reg_supported in the clock scaling check
Date: Tue, 28 Jul 2026 19:35:42 +0200
Message-ID: <20260728173542.61146-2-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728173542.61146-1-jorijnvdgraaf@catcrafts.net>
References: <20260728173542.61146-1-jorijnvdgraaf@catcrafts.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sdw_slave_set_frequency() treats class_id and prop.clock_reg_supported
as equivalent evidence that a slave implements the bus-clock base and
scale registers, but the bank-switch reprogramming path checks class_id
alone, so a class-0 slave that declared the registers never gets the
next-bank scale written there. The registers are SoundWire 1.2, not
SDCA, so a device may well implement them without setting the class
field.

Extend the helper to honor clock_reg_supported, as discussed with
Pierre-Louis in the WCD9378 review. This also makes a link whose
peripherals all declare clock_reg_supported eligible for dynamic clock
scaling in the generic bandwidth allocation, which is what declaring
the registers means.

With the helper extended, sdw_slave_set_frequency()'s open-coded test
computes the same predicate; call the helper there instead, so future
quirks or updates land in one place.

Link: https://lore.kernel.org/all/5717102b-f7ab-42b2-8065-064d94dd2bee@linux.dev/
Link: https://lore.kernel.org/all/6991398d-4ae4-45ee-85d0-3b66462fec1d@linux.dev/
Assisted-by: Claude:claude-fable-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
---
v2: also call the helper from sdw_slave_set_frequency() instead of
keeping the same test open-coded there, as Pierre-Louis suggested.

Both patches re-verified together at v2 on the Fairphone 6 (SM7635,
WCD9378): "Configured bus base 1, scale 2, mclk 19200000, curr_freq
9600000" for both slaves at enumeration, no codec errors, capture
works. On the qcom bus the helper extension only adds next-bank scale
writes of the same value on bank switches (the clock is fixed).

One behavior change I cannot test: the helper also feeds
is_clock_scaling_supported() in the generic bandwidth allocation, so an
Intel link whose peripherals all pass the check - max98363 is the
in-tree clock_reg_supported case - becomes eligible for dynamic clock
scaling where it previously ran at a fixed clock. Only configurations
that fail the bandwidth check today can select a different frequency; I
could not test that combination, flagging it for the Intel side.

 drivers/soundwire/bus.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 0490777fa406..0c1cdd603926 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -817,8 +817,11 @@ bool is_clock_scaling_supported_by_slave(struct sdw_slave *slave)
 	/*
 	 * Dynamic scaling is a defined by SDCA. However, some devices expose the class ID but
 	 * can't support dynamic scaling. We might need a quirk to handle such devices.
+	 * The clock base and scale registers themselves are SoundWire 1.2, so a device
+	 * may implement them without setting the class field; the driver says so with
+	 * clock_reg_supported.
 	 */
-	return slave->id.class_id;
+	return slave->id.class_id || slave->prop.clock_reg_supported;
 }
 EXPORT_SYMBOL(is_clock_scaling_supported_by_slave);
 
@@ -1385,7 +1388,7 @@ static int sdw_slave_set_frequency(struct sdw_slave *slave)
 	 * DisCo property to discover support for the scaling registers
 	 * from platform firmware.
 	 */
-	if (!slave->id.class_id && !slave->prop.clock_reg_supported)
+	if (!is_clock_scaling_supported_by_slave(slave))
 		return 0;
 
 	scale_index = sdw_slave_get_scale_index(slave, &base);
-- 
2.55.0

