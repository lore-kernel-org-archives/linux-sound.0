Received: from MTA-12-4.privateemail.com (mta-12-4.privateemail.com [198.54.127.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF2E424649;
	Mon, 27 Jul 2026 16:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169697; cv=none; b=QBvmznITjZ4wa6MhZfAyrKaqQuLI+cqwhXjoT3N1QfnviaDWYjolDD3ptiQ2J6abG1SrfPm8lWwMZS/s5lLzzXDPXcY9/99WvXEqWOtzHG78sUk5PH6vL9nmqQFc9cNk/X3VT5tnTY89cuAWDYEv97vStiAUMsCIBIh2kAYgrfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169697; c=relaxed/simple;
	bh=PfwAousGFkzSGdJV4YMHsE4vQG65RwtniVIt9cceKTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EKsHtCwFUp3Hc5jWTmcwpDfpkY5dVzXI40RxRbKqzrfrPyWCR5cOGCsaa8FN0IQ06yRLwT1t3PymPVz/HTGrjdipN1fBzLC2KnHCmp6kD0ITjT6HP/8HMiYEUKKdstz4GP6Bj50Y16yBfkWoiIJb6PZw/ntE5YlfrIK4UOSQ8xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.127.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (K8S-PROD-WORKER-12 [87.215.145.39])
	by mta-12.privateemail.com (Postfix) with ESMTPA id 4h83tF406Rz3hhTg;
	Mon, 27 Jul 2026 12:28:04 -0400 (EDT)
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
Subject: [PATCH 2/2] soundwire: honor clock_reg_supported in the clock scaling check
Date: Mon, 27 Jul 2026 18:27:41 +0200
Message-ID: <20260727162741.68081-2-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727162741.68081-1-jorijnvdgraaf@catcrafts.net>
References: <20260727162741.68081-1-jorijnvdgraaf@catcrafts.net>
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

Link: https://lore.kernel.org/all/5717102b-f7ab-42b2-8065-064d94dd2bee@linux.dev/
Assisted-by: Claude:claude-fable-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
---
Pierre-Louis agreed the helper should be extended in the WCD9378 v1
thread [1]. On the qcom bus this only adds next-bank scale writes of
the same value on bank switches (the clock is fixed); verified on the
Fairphone 6 that capture still works with them.

One behavior change I cannot test: the helper also feeds
is_clock_scaling_supported() in the generic bandwidth allocation, so an
Intel link whose peripherals all pass the check - max98363 is the
in-tree clock_reg_supported case - becomes eligible for dynamic clock
scaling where it previously ran at a fixed clock. Only configurations
that fail the bandwidth check today can select a different frequency; I
could not test that combination, flagging it for the Intel side.

[1] https://lore.kernel.org/all/5717102b-f7ab-42b2-8065-064d94dd2bee@linux.dev/

 drivers/soundwire/bus.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 0490777fa406..d94e44b59050 100644
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
 
-- 
2.55.0

