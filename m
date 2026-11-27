Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791802;
	b=umM5YQNviAHZRsJMrGNwyztGdDiQRE+9HAuIClDYx9xk+LAKCiGqXkrAwt0desu3f11c
	 smNCcA+hKBRtcPa+okjU9/iYKaeiU2izGTpMFGBcf8nhB3DKpNa6NYEmTsw1nYsFARBhE
	 bD6B4nZllTRCK9s6rsMuIfXOXpoVQBnT3Q9BODSo6y+ACPvJ30CubsRk9EkrG1I4lh9nS
	 jejQgWxu77x75er2u/JS2tIuOmsky9wv6PqDgyEoVp6X4IhPuIedWEsZxuS6QGGMp2uyE
	 yIPckqkhyT+Bj73whQSDdnA0FmGjmX8XuK7yA1wP6VtliifXuKprG5BiHe/kMz240Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791802;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:DKIM-Signature;
	bh=fLagGyz9f4PWucsYik9AhnenopQ/f/gFg1DETE/XelQ=;
	b=hU20F0Nr5Gm39utfiiQfSh4vSS9aKI0VVMo1kFls/w9Cn+FVC22+oqJ1FGtwmQ++EKr5
	 jszk2JAp9jWLw9dqLQvmqdgsSiw4GphWLepYcDhgBONJ+fvNo/Fp2MkP+QFqvMN1MBaEX
	 0fKwcHtAeHa3LSFF38u/IKdWpHCtefivBOvMaLt2cZIJu1vF5lZyhra2hOyUZKmYm+7xG
	 rYVWxZuUXZgiP5KwnWJT2x5NFaLPcRE5fcFXlEh7sgaMn9bypJlLyh+E1OCJnEERdTXyF
	 e6LSAFtPlYxluQCyOVH0URhLjVtV7XLDN+tCzOYPNem6kgR+mfz0tkPo8+YJWsp3zQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=eYyWB5dU;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8C1606A31C;
	Fri, 27 Nov 2026 15:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F8C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=eYyWB5dU
Received: from abreu.molgen.mpg.de (g44.guest.molgen.mpg.de [141.14.220.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A9FBE4C442F953;
	Fri, 27 Nov 2026 16:02:09 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soundwire: Suspend and resume managers and peripherals asynchronously
Date: Fri, 27 Nov 2026 16:00:56 +0100
Message-ID: <20261127150101.48880-2-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261127150101.48880-1-pmenzel@molgen.mpg.de>
References: <20261127150101.48880-1-pmenzel@molgen.mpg.de>
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1795791729; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=fLagGyz9f4PWucsYik9AhnenopQ/f/gFg1DETE/XelQ=; 
	b=eYyWB5dUYL6P6kdN+ix5U4jkVvT+0MTdZ0N8hb4nE6ZLKKkxkXwCB01GxBHaPdUO4U5aLVRY946t
	0ab1XvGLYQZdTwSEv7uguEgSXWfzumsd+lLrQJcbfDW1ooIdAnGdsWGBnpt707eNkhqAl03CRc3gY1
	GIOfW202yP1Rse9NoWq6ZjixGtVai6FjfFJDrx93H34Ayjm/ROhA/dcrXqSfCesC4bWYVqmUAkLrhT
	+1HjHs6NyPEr2Mnez2BSH4gWbwv36xU7wy1muo1C4QqQ7PmKMqCg81iP8kx+R0jThOh8S0mUL8cq3m
	kzytoF4FlFjAhv9U72aarwvW2PjqhECg==

On system resume, the resume callback of a SoundWire peripheral driver
usually waits until the manager has enumerated the peripheral again and the
driver’s update_status callback has re-initialized it. The PM core runs the
callbacks of devices without the async flag one after another in dpm_list
order, so the peripherals on different links wait for each other, and each
of them also waits for all synchronous devices before it in that list.

Apart from the parent-child relation, which the PM core respects for
asynchronous devices, the manager and peripheral devices do not depend on
other devices in the system sleep transitions. Codec drivers that need
their peripherals active, like wcd937x, wcd938x and wcd939x, add device
links, which the PM core respects too. So enable asynchronous suspend and
resume for the managers and the peripherals.

On a Dell XPS 9315 (Alder Lake, SOF), in one cycle, the RT1316 amplifier on
link 2 took 16.3 ms in its resume callback, and the RT714 DMIC codec on
link 3 took 9.9 ms after it. Together with the next patch for the Intel
link devices, the resume callbacks of the two links and the two codecs now
overlap, and their span shrinks from 28.9 ms to 17.1 ms (median of five
s2idle cycles each).

Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---

Notes:
    The analysis (sleepgraph device callback timings, function traces of the
    link start-up), the patch and this commit message were drafted with
    claude-opus-5-5 (Claude Code), asked to cut the s2idle resume time of
    this laptop, see Documentation/process/generated-content.rst. The tests
    are in the commit message and the cover letter.

 drivers/soundwire/master.c | 3 +++
 drivers/soundwire/slave.c  | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
index 440bfc52ccba5..54ce317ab1628 100644
--- a/drivers/soundwire/master.c
+++ b/drivers/soundwire/master.c
@@ -147,6 +147,9 @@ int sdw_master_device_add(struct sdw_bus *bus, struct device *parent,
 
 	dev_set_name(&md->dev, "sdw-master-%d-%d", bus->controller_id, bus->link_id);
 
+	/* the managers of different links can resume in parallel */
+	device_enable_async_suspend(&md->dev);
+
 	ret = device_register(&md->dev);
 	if (ret) {
 		dev_err(parent, "Failed to add master: ret %d\n", ret);
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index a7d2938b031d0..3e77c9c586d17 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -84,6 +84,12 @@ int sdw_slave_add(struct sdw_bus *bus,
 	sdca_lookup_interface_revision(slave);
 	sdca_lookup_functions(slave);
 
+	/*
+	 * Peripherals wait for their re-initialization on resume, which can
+	 * be done for all of them in parallel.
+	 */
+	device_enable_async_suspend(&slave->dev);
+
 	ret = device_register(&slave->dev);
 	if (ret) {
 		dev_err(bus->dev, "Failed to add slave: ret %d\n", ret);
-- 
2.54.0

