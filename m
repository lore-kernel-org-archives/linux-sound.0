Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C7C288515
	for <linux-sound@vger.kernel.org>; Fri, 20 Feb 2026 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771601791; cv=none; b=ZTQfdEyD9sqfHkgcoPjXuytvRuO227SdqTxpkOXvqHB/43AN/pgcPh0YFDq3sgRKZKfhVVYYS3GOdn1ubq7s3BGfGuuersYdeSkBfm2jzQD2w2DSj64LdbYVDq7zMuI+qY8eRYn/Ehuz99pNvJMrOmiitKj5P9Zum6lIPqDVJto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771601791; c=relaxed/simple;
	bh=CQ67AsvEI3yOXWAtRv13pZ82/ngf1M4XsdC31ATwGQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SawD04haBHoSoCHnW29X1E0GC7DZAtd6l4Qej5YLMGVwaeHrcrggSRsT/1Y0rERG78WRTqNuGXXR5/BHms7i4mkuzDzRCJl8GWpfbrfGR316eIpyXNtG7Kd4d4soTd9qdzYkaOyvEEeDWRKIfd8EY+BpgEFfPi+RsJQbhiNBt5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=XzS/UyH2; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="XzS/UyH2"
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 151566E864E;
	Fri, 20 Feb 2026 16:26:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1771601204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jcjMSxdbFkOEnENOwBOzzCn9Qik6NsSjsj4WzDYfovQ=;
	b=XzS/UyH20aYdDsyEhua8XZxJ8AA1A7f4Ak4agxM+LABJ4TE2Pm6cHhH3QlyOAVRz1JXpNB
	AYQom2AYOUK5SePDtzVRGtgHfL9q29x/MQX7/Gv4Bs39+mjffLG405ReVk0QY/y9DKTQeo
	Q/n38OffCnJFImw95AUUuYzKHVFouW+HHU9jXFFV+F1XBFsXdsYe7erRN0Xa4Vt4JRwsqC
	L+HVoMcgKK/zEVwXeYoLhYFeJJSAkq/7e4XKu9gI7kGcQ497JvH7/yd8YjpN6ffmdcvFMk
	3fIBE8mKrGv15jzxKzO0NqrfsIpN6fU9akAildDE6nkkj6u1yJD3ihlLtMuxug==
From: Sander Vanheule <sander@svanheule.net>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH 0/2] ASoC: sti: regmap_field usage improvements
Date: Fri, 20 Feb 2026 16:26:32 +0100
Message-ID: <20260220152634.480766-1-sander@svanheule.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uni_player_parse_dt_audio_glue() allocates two regmap_field objects on
the device's regmap. However, error codes from these allocations are not
propagated correctly and the resources will leak on device removal.

These issues were found while looking for users of regmap_field_alloc(),
to assess the impact of adding a cleanup helper for regmap_field. It
appears this driver is the only (remaining) in-tree user of this
allocator. Since the resources are long-lived, it may as well switch to
devm_regmap_field_alloc().

As I don't have access to this hardware, these patches were only compile
tested on a UM build.

Sander Vanheule (2):
  ASoC: sti: Return errors from regmap_field_alloc()
  ASoC: sti: use managed regmap_field allocations

 sound/soc/sti/uniperif_player.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.53.0

