Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFBC7F
	for <linux-sound@vger.kernel.org>; Sat, 11 May 2024 16:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715445870; cv=none; b=M/ATTZs8V7EE7cxbpPekrHpMiS2J0uYCHyzpuBdH5p6Ur+fkEAIAxJQVB7TcQEN/Qiy5mHlGBQx0YFzVW4gI5AQR6fhTR/g6gQrU89ISb0A1gjVt6JvvoeZbLie/sfXCn/z3b69bT0muIGIZndmaenNmgt83DfzgAnqj2fGlZYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715445870; c=relaxed/simple;
	bh=RNY+20kElI3e0ixT1T0F9spgouz/9oDO53voT1bssPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TloyDjnSUXdj1fdhOdttrI3v94HXW7qsynApEAKWV3rhEU2wvn4TL6SSmWBXXPXt9ZLkFzpFZ7ooT1yz+9wqLXNLlS0m5mS82HDPOZ51CIclS5nlFsXeoxKxI/X4aDolmqw17slCOSDKXfYch4GYnHGRPOmaPm8Dzhp4jfm7fjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=hgeGLwqV; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="hgeGLwqV"
Received: by m.b4.vu (Postfix, from userid 1000)
	id BD974604B9CB; Sun, 12 May 2024 02:14:17 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu BD974604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1715445857; bh=jsBrWf1xMmYojpDYuK8XanwE9vskiC1wWoIIvT7R7lk=;
	h=Date:From:To:Cc:Subject:From;
	b=hgeGLwqVie2crIPYWfsLHflcwylPAE3b2pWhwt7FBZfbMmtrsgeQmO/G/BJ/abEME
	 wFSXPePzMn5diZEzFahE9Ix18n+4EqQM10iaOwGB+mPIx1Q8O+KB0U6g0WYBmmWW6+
	 hUtoqZvIn8LaURXjsKvfIe7LJCRpPyyzNFRbLVpk+2o7MYEjkNrYAC8S/rWPCnWkxz
	 5XI/Rm20hSM7/B7TEj0CcL8uAXPdrNjrxi7ITs6mdVWk8bUfivI/awUuqlTMzJ/GoC
	 uBpd1e6YtkvdIaK3AHTEOG/Xr1UCpjq/q8wU+CB3be1ml4RABhzNh85NWtLK9MCBYP
	 8/YsTH4vzB6mA==
Date: Sun, 12 May 2024 02:14:17 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: scarlett2: Increase mixer range to +12dB
Message-ID: <Zj+gYT4F2XeKTD93@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The values loaded into the mixer are 16-bit values, with 8192
representing 0dB, going up to a current maximum of 16345 (+6dB). All
supported interfaces have no problem going up to 32612 (+12dB), so
update SCARLETT2_MIXER_MAX_DB and scarlett2_mixer_values[] to allow
for this.

Tested with:
- Scarlett 2nd Gen 6i6, 18i8, 18i20
- Scarlett 3rd Gen 4i4, 8i6, 18i8, 18i20
- Scarlett 4th Gen Solo, 2i2, 4i4
- Clarett+ 2Pre, 4Pre, 8Pre
- Vocaster One and Two

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 2dd03b46964e..1150cf104985 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -184,16 +184,16 @@
 /* maximum Bluetooth volume value */
 #define SCARLETT2_MAX_BLUETOOTH_VOLUME 30
 
-/* mixer range from -80dB to +6dB in 0.5dB steps */
+/* mixer range from -80dB to +12dB in 0.5dB steps */
 #define SCARLETT2_MIXER_MIN_DB -80
 #define SCARLETT2_MIXER_BIAS (-SCARLETT2_MIXER_MIN_DB * 2)
-#define SCARLETT2_MIXER_MAX_DB 6
+#define SCARLETT2_MIXER_MAX_DB 12
 #define SCARLETT2_MIXER_MAX_VALUE \
 	((SCARLETT2_MIXER_MAX_DB - SCARLETT2_MIXER_MIN_DB) * 2)
 #define SCARLETT2_MIXER_VALUE_COUNT (SCARLETT2_MIXER_MAX_VALUE + 1)
 
 /* map from (dB + 80) * 2 to mixer value
- * for dB in 0 .. 172: int(8192 * pow(10, ((dB - 160) / 2 / 20)))
+ * for dB in 0 .. 184: int(8192 * pow(10, ((dB - 160) / 2 / 20)))
  */
 static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
 	0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2,
@@ -209,7 +209,8 @@ static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
 	3078, 3261, 3454, 3659, 3876, 4105, 4349, 4606, 4879, 5168,
 	5475, 5799, 6143, 6507, 6892, 7301, 7733, 8192, 8677, 9191,
 	9736, 10313, 10924, 11571, 12257, 12983, 13752, 14567, 15430,
-	16345
+	16345, 17313, 18339, 19426, 20577, 21796, 23088, 24456, 25905,
+	27440, 29066, 30788, 32612
 };
 
 /* Maximum number of analogue outputs */
-- 
2.44.0

