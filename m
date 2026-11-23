Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420526;
	b=gcMtF17l8fTOyDqPBqfHXGSAArkxGf3Dgu9Pc6hyJykLlmE3WwUNiRrq1CJGwHnt9RMf
	 vhDVb99odlCeObggV+0rBgmC+vcJC4P97OY+FVZdLmtW0zZH3GL5WsPe/Z8TVw1K3U6RL
	 B6x1lpdSR2oqZjNKus91yDE6q9p6KTJf6Tdy0dvyQ8nAaIHP6pTMt7hVWKkJvbMyZOF6c
	 yEsWhbUUTlpOE7Z755SNarC3093JGO0VnWV1sgI7jOYbJmVRBqaj4aUjOtkXkLzM4I9cn
	 uT4t4MMO5W/wAYohhmeqmH6Kd4vBlgsvqJxQxvsUHpmxdR/NP1nsOZFPzQaikYTrYHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420526;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kRuttRtAXghKQw9JQDeJ35r5iBaZC3tabdn1xUwMZh8=;
	b=kSv1KZxfhIviLzSYW5Xj0Rk8HTi9CIHr8vrrS22LTUZVoRNLCcxQoCGTPOrV+d6Jr3Na
	 Zy4PkuMDZlZgADgpnW3jURffEk+kW2WrmZDpFIIpm7buwqD4Ax+CEfzdmKroQrMbkyNiy
	 S6zsnaULaLpUcZMORVQlNaNGXe8zw6YRmpjHjI3lnA30/liIdEyi01EBWmbVYtrzTupZ8
	 MEhWctamxSmyEm0yYSVQi5Twp4/GI7PfVPSyjRxBrrQtlBONkFIMg47trOKGPU6EyOGkp
	 U632cuxqosJsdA5D/+NCfNJC7M1EcWuVAITiW0wv1SGHdMGw67azV8u6lNwbor/ziUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="X/z8j5j8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13D4606A31A;
	Mon, 23 Nov 2026 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X/z8j5j8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83ECA1F000C4;
	Mon, 23 Nov 2026 07:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420526;
	bh=kRuttRtAXghKQw9JQDeJ35r5iBaZC3tabdn1xUwMZh8=;
	h=From:To:Cc:Subject:Date;
	b=X/z8j5j83NXsy219rlE97U1ZwCvA9m3UCwjOWy+p+d0uN9nB9+KI1kXbt14FWjv9D
	 HOMmBpP2slCUJFb1Dw+/B8S5w9KD1Ho6d5rYvwxrlHUyMIhcXCmBhCoqAaY+64zSSt
	 f8O57Z8QV/arQlbWP8q1ZEQfxdB/ChWHIWebEKuf7RDgOwpX9apFo3cS2ALV1903Di
	 5lFxDXzY5xyH/uKkqke0OMto2MH8CD5tMzEKkexcwfCsdZbb5iLx7xDEdvwZ+y024F
	 OY83nY1POMDxiEWCrUJ3hbuIFO+zgdRLbW5G3zAvzq5iYXCM4JxrREziWbUz8DmZA+
	 KN6cJVgwb9H4A==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	HyeongJun An <sammiee5311@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 00/10] soundwire: Fix Critical and High issues reported by Sashiko
Date: Mon, 23 Nov 2026 07:54:21 +0000
Message-ID: <20261123075522.405347-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These issues were reported by Sashiko.

Patches 1-3 have been hardware-tested on Intel Tiger Lake / Cirrus Logic
systems by HyeongJun An and Charles Keepax; the remaining patches have
been build-tested only.

v2 => v3:
 - Rebase onto soundwire/next
 - Collect Reviewed-by and Tested-by tags on patches 1-3 (Charles,
   HyeongJun)
 - stream: Validate slave port configuration and stream parameters
   before mutating runtime or stream state on error paths
 - qcom: Track newly allocated port_mask bits in a local bitmap so error
   rollback in qcom_swrm_stream_alloc_ports() never clears pre-existing
   ports

v2: https://lore.kernel.org/all/20261103095445.81414-1-lee@kernel.org/
v1: https://lore.kernel.org/all/20261030104840.3361217-1-lee@kernel.org/

Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: HyeongJun An <sammiee5311@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>

Lee Jones (10):
  soundwire: bus: Hold bus_lock when looking up slave devices
  soundwire: sysfs: Use sysfs_emit_at() in array show callbacks
  soundwire: stream: Prevent m_rt_count underflow in
    sdw_stream_remove_master()
  soundwire: stream: Clean up allocated runtime resources on config
    failure
  soundwire: intel_ace2x: Protect bus.bpt_stream with bus_lock
  soundwire: qcom: Prevent pconfig buffer overflow in
    qcom_swrm_stream_alloc_ports()
  soundwire: qcom: Disable runtime PM and avoid clock underflow in
    qcom_swrm_remove()
  soundwire: qcom: Check clk_prepare_enable() return value
  soundwire: qcom: Serialise ctrl->intr_mask updates
  soundwire: qcom: Prevent stale broadcast IRQ from completing
    subsequent command

 drivers/soundwire/bus.c             |   6 +-
 drivers/soundwire/intel_ace2x.c     |  20 ++++--
 drivers/soundwire/qcom.c            | 100 +++++++++++++++++++++++-----
 drivers/soundwire/stream.c          |  96 ++++++++++++++++++--------
 drivers/soundwire/sysfs_slave.c     |   6 +-
 drivers/soundwire/sysfs_slave_dpn.c |   8 +--
 6 files changed, 174 insertions(+), 62 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog

