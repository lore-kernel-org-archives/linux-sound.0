Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB3532937A
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 05:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790229205; cv=none; b=MVML2LrCy2iD9OrLhaV7DyVFaHTYoa92yXcCZ6YMuiRxa3v+4kjKxdwwGu9QH38yvmeC/XdxpFtVDViXYw8NKy0GhrMe9GGPKYA/Hlr4AL/SDVc0nqZTBBlRiCofO3c7XoMwH1D0+G9Zcd+eMXhmC/T3VnAK1CJmQCtxfE+uBFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790229205; c=relaxed/simple;
	bh=hzpGQhYnTyhqcrL9brsm+8ctP1I5x4qm4pICrcrYBpo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jIiCX6ofyCmdapgFP5ZK/P+ois98Id8rgyBE/MNT+r49y1ZvP0QGC4gBencIHk8cMQl8QSXvvAkvMNA9sA+rybrfp2p2AWoxJThd1umtuGR6eft/d22p0fZDNIugGI9+BgFR4MH5Pshgq4RO8ZMmhQxvDxV9yzxLl/o6qoodINM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIKaJizZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIKaJizZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70C01C2BCF5;
	Thu, 24 Sep 2026 05:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790229205;
	bh=hzpGQhYnTyhqcrL9brsm+8ctP1I5x4qm4pICrcrYBpo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GIKaJizZ8UgszsJYwiLArNjcseXpD/7ouwqZXxLjq9aaV+vsqZR+8ta8EB07Tl8iL
	 5ASWsjKhDhLjp5xss+K75WkpZFfVQVzacQOuq2UGg0XPtA47ifcpW8hFKC5d391rvp
	 6yLDQ3bMQ0trUvIXsq4LsVZLYhzP0JQ+lPvQG4LBc2vAUDg6Y3zXpi72LE170aJOVo
	 PbHN5rj6/zfK0IdxMR+6qr62RG76aSKau8dS9siZmVos86HuRBpkLyU0V6Z71mCAp2
	 jclqYDOL38ucCAHxy6GOZBDXANfc1jTi3ADF7QnmOAB82Vzg00c8asIMwwGedjFdpY
	 F61yGAwgU6MhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D65AC98312;
	Thu, 24 Sep 2026 05:53:25 +0000 (UTC)
From: Shuming Fan via B4 Relay <devnull+shumingf.realtek.com@kernel.org>
Subject: [PATCH v2 0/3] Add ASoC machine driver support for the RT766 and
 RT767 codecs.
Date: Thu, 24 Sep 2026 13:53:01 +0800
Message-Id: <20260924-rt766-v2-0-e0b63606a5e8@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL26tGoC/22Nyw7CIBBFf6VhLQamiOLK/zAuRjq1+GgNINE0/
 XehrjQuT3LPuSML5B0Ftq1G5im54IY+AywqZjvsT8Rdk5mBAC0MKO7jWmtOIGwtpMFGtCxv755
 a95w7+8OHw+N4JhuLXBadC3Hwr/koybL7bSbJBdeEqAgt1qR2nvAa6bK0w42VaoK/HmRPmlWjD
 Fiym/rbm6bpDe5blIXmAAAA
X-Change-ID: 20260924-rt766-e20c3019ad0f
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: Shuming Fan <shumingf@realtek.com>, derek.fang@realtek.com, 
 lars@metafoo.de, oder_chiou@realtek.com, linux-sound@vger.kernel.org, 
 flove@realtek.com, jack.yu@realtek.com
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790229204; l=1472;
 i=shumingf@realtek.com; s=20260924; h=from:subject:message-id;
 bh=hzpGQhYnTyhqcrL9brsm+8ctP1I5x4qm4pICrcrYBpo=;
 b=qGtCHiqMzztIZwbgF1psKT5t9TwmuH2cRQQHnIqNLEQxiNHEFrCcTGlcRnGRjd5PJ0BIHq7bD
 00fDv7Dc83qC38ANfEfhMNmPsdJuTNkj7+LZ8zw0tulIKg37MvBAFG9
X-Developer-Key: i=shumingf@realtek.com; a=ed25519;
 pk=ZM8Pg7tEJ0SDXQeBw6SfvcYyqXU9nF88DuTyxzf9utE=
X-Endpoint-Received: by B4 Relay for shumingf@realtek.com/20260924 with
 auth_id=1053
X-Original-From: Shuming Fan <shumingf@realtek.com>
Reply-To: shumingf@realtek.com

This series adds the required codec information and codec-specific DAPM routes,
enables wake capability on Intel platforms, and avoids re-initializing blind writes.

The series includes:

Add RT766 and RT767 to the SoundWire wake-capable codec list.
Add RT766 and RT767 codec information to sdw_utils.
Add support for codec versions 3 and 4.
Add the RT766 speaker and headset DAPM routes.
Avoid re-initializing blind writes.

With these changes, the generic SoundWire machine driver can recognize the RT766/RT767
codecs and set up the corresponding ASoC DAI links and codec routes.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
Changes in v2:
- use b4 command to send this series and add a cover letter

---
Shuming Fan (3):
      soundwire: intel_auxdevice: add rt766/rt767 codec to wake_capable_list
      ASoC: sdw_utils: Add rt766/rt767 support
      ASoC: rt766: avoid re-initialize the blind write

 drivers/soundwire/intel_auxdevice.c               |   2 +
 sound/soc/codecs/rt766-sdca.c                     |   2 +-
 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c          |   6 +
 sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c |   8 +
 sound/soc/sdw_utils/soc_sdw_utils.c               | 172 ++++++++++++++++++++++
 5 files changed, 189 insertions(+), 1 deletion(-)
---
base-commit: 782424a17d77ae6de07b490618b523066c528f59
change-id: 20260924-rt766-e20c3019ad0f

Best regards,
--  
Shuming Fan <shumingf@realtek.com>


