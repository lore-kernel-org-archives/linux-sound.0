Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F7E2E0417
	for <linux-sound@vger.kernel.org>; Mon,  1 Sep 2025 09:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756718459; cv=none; b=eSWQjvPZvIqrnNRq9GmbryqNYti5X8shV90BNBnNelS25xkNMdqxZgZHNHz9yt8uuU1XTKtAYr+7ZSgOX+wOIbsStmals98DYVVr3/Qtuhxq/Jaq5sOErX9OoJh9W8y67vV2oC2ippgCTp/CKcNX/UU8kR5FqmkbYBFfZinZNBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756718459; c=relaxed/simple;
	bh=ML4S0rF/tkDhN+3lsKun7u6d9LYUxTbMll7DA/fC5po=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kRD/y8JPf5lfjKE157Y34h5YD3LdghWK87XOl++W7WjuCQ1IB3z3kc4BzhrtBnj+NZY285Mcvp/ZeX+t1HfQb7woOuYboN6CfK011D1arNcB9+UhGj0mELNKAcwEeeWSwYtH1sUaXv8FYUz+ZXIkzVS1MGlf2QtqzTLXXi1/dEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wuest.me; spf=pass smtp.mailfrom=wuest.me; dkim=pass (2048-bit key) header.d=wuest.me header.i=@wuest.me header.b=cZPCJiaL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eNdAIl76; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wuest.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wuest.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wuest.me header.i=@wuest.me header.b="cZPCJiaL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eNdAIl76"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7B2827A0273;
	Mon,  1 Sep 2025 05:20:56 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 01 Sep 2025 05:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wuest.me; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1756718456; x=1756804856; bh=UESsNAJovC0+HKip7p8E3
	681t5kc0+t2Fk3o9Os6ucQ=; b=cZPCJiaLMLyGqFOVFnw0cgECv5CwKhsFrZ9as
	Rd5CS/9eK18mdrrNlTkyZ6JboXvOST9w4TMwEjO8P49O0CKkHGm/emhzX4fmmW+F
	7egVAZ5QFnv/SP3IOgbfBVTQoJvvoBLP12q+ycfx0WJG3dAk21qO5UlgWwakMbml
	DTGk2ynKXVjRLxBQv7rW6mv+PEoG4TmH9lC+gYOhfjjIhkLLJRVmkUOINI/jTElS
	7U67ZQvBWU8OW31o9mn4cGnIyoP74nXCxC6LIBjOll+Jek0yPv67NjKnL8eBFJIM
	O1feCKtJZHxf2bYsix/HG+oo1BLzGorAf7kefvN7+D9gN9Qmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756718456; x=1756804856; bh=UESsNAJovC0+HKip7p8E3681t5kc0+t2Fk3
	o9Os6ucQ=; b=eNdAIl76+3Fsbs4PLO7q9P4En18d1Qi3DjFs5la/f/5RXm5XoxK
	sJL802H6Pl/o1hHLRGbKjgxQyF0C0MnQwon6PrvvfwSHeHATewRT+9Ke7nEtVI6N
	SdZbBUDixBvUx6iD2PhL8G7itQ829vvGcJzyTFALjAdruRE5BLbgUGAzCeo7qO/O
	/tXfvJJ+3lnRMO6pxf0YWMmuLM/jbEYr17OTKrvR9mYeCuzmlMX7NJA5MbdiAnG3
	0FkuWew5aeVkt4NlA+4ZK5qq84ASDp7mE3/ArZNrShhrTAC9g2pcFWMhjK/LKyV9
	Cgji3Z6fgpWyM7V0Zb2RogVP1Zcld14JAaQ==
X-ME-Sender: <xms:d2W1aDDmpNwMHSe7Y6Bpntpbk6QFmjvgDkpudz7AqNwI1bhwuZ67Gw>
    <xme:d2W1aEEwL1sgBdb_pc1EtrljpcW09shYcOPoeYn29CthsuNGQhO81hQPhQTZKzokK
    am9B0GWjvQJf-gNnHk>
X-ME-Received: <xmr:d2W1aLL_fev9Em50naBFkoP3ZNx98PLrrPZVIN27IYEPTTrh8IJKhcb6V0nCEJcAkHeKFLYI5iXUusicg59k5OMPEG9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduledujeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhinhgrucghuhgv
    shhtuceothhinhgrseifuhgvshhtrdhmvgeqnecuggftrfgrthhtvghrnhepheevgeefff
    fguedtfeffhfefveekfedvkeekheegheejledtvdeigeehieeigfefnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthhinhgrseifuhgvshhtrd
    hmvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    thhifigrihesshhushgvrdgtohhmpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtg
    iipdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehtihhnrgesfihuvghsthdrmhgv
X-ME-Proxy: <xmx:d2W1aIkAuTmNNTRQbjMluj2hPGvY0eDOlByjgjasdrv-L8sbzYHenw>
    <xmx:d2W1aDSeImWlu-8tagn_bOU4mFZNfQHNoFHW-4xODRu_fyN6uJKpHQ>
    <xmx:d2W1aKInu6EroTXlGCX_4s-FTl7Mwy6jQcfG7s7zx22ZL2m2QZm1MQ>
    <xmx:d2W1aJBS0CJw7wsHFo7pXe2uUqlL4lUIFYjrs1gmEH0fbPWoTQQ_Rw>
    <xmx:eGW1aCb1VdTYiDYQNRIB0nXZkZYsV50AiZ69jBQMZh-V3dh0IMwQOYsc>
Feedback-ID: i33814470:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Sep 2025 05:20:55 -0400 (EDT)
From: Tina Wuest <tina@wuest.me>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Cc: Tina Wuest <tina@wuest.me>
Subject: [PATCH] ALSA: Allow Focusrite devices to use low samplerates
Date: Mon,  1 Sep 2025 12:20:24 +0300
Message-ID: <20250901092024.140993-1-tina@wuest.me>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 05f254a6369ac020fc0382a7cbd3ef64ad997c92 ("ALSA: usb-audio:
Improve filtering of sample rates on Focusrite devices") changed the
check for max_rate in a way which was overly restrictive, forcing
devices to use very high samplerates if they support them, despite
support existing for lower rates as well.

This maintains the intended outcome (ensuring samplerates selected are
supported) while allowing devices with higher maximum samplerates to be
opened at all supported samplerates.

This patch was tested with a Clarett+ 8Pre USB

Signed-off-by: Tina Wuest <tina@wuest.me>
---
 sound/usb/format.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 0ee532acbb60..ec95a063beb1 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -327,12 +327,16 @@ static bool focusrite_valid_sample_rate(struct snd_usb_audio *chip,
 		max_rate = combine_quad(&fmt[6]);
 
 		switch (max_rate) {
+		case 192000:
+			if (rate == 176400 || rate == 192000)
+				return true;
+			fallthrough;
+		case 96000:
+			if (rate == 88200 || rate == 96000)
+				return true;
+			fallthrough;
 		case 48000:
 			return (rate == 44100 || rate == 48000);
-		case 96000:
-			return (rate == 88200 || rate == 96000);
-		case 192000:
-			return (rate == 176400 || rate == 192000);
 		default:
 			usb_audio_info(chip,
 				"%u:%d : unexpected max rate: %u\n",
-- 
2.51.0

