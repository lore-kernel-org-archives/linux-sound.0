Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.158.83.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987731;
	b=uF/GrOTGexJyzm5NOTom+pFmnVQSLMdBdh7nhcfvSXmlCCZ2g9ndKBtGOei+3W3fPzt5
	 3IRSdIHOaRi2OLajeOwzoRYEFabujqJKlwxGAbijDozo06oMXIbz6vzO1pvQGdTRzf7Qb
	 P9IMGUMC6+CbqNmvclXhATbBvWMuFdd0tG1hSRmYLOKx6p4nfTOgM2zT1ubH/KZCd8d1R
	 UrFsxEZoCDHcn59l1xJqLC4EInLM88W2BxGts0QLsbSu4eq6XDpUo8HYW8qlbHmTC1g66
	 jCZMaxKHZLNbdHZTwQcLSCBHtpDAOkmtxnFGG/ulW1/NeL3UejU9sscfAfGyoQ/R30Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987731;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Address:
	 X-Report-Abuse-To:Received:Feedback-ID:X-Mt-Data:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=w3R4NWkzAVN6bv243bgvKvls0Ew5K6M+j/b7qLFiaX4=;
	b=pVwREPZ6Nap+4bTe89M28HVmTOsvqIXRRNxu+zM+k6kwoVUPprIzZYXGUe5PlfGY4bk7
	 ezTPNJ67BcfjKzLH+tifTU72oSCMRicUraKQWulGIPIV4gYayOQPtZlYoKz1qWGO/wOV0
	 BBDRFkaYfpjvhDlUiGDWLV/fmlRtUyTZpvHx6cTZS+2dtwWrT/cEtJ57UaJIW3Gv6kfA+
	 UUhi6l3l3b1K6NLjV/rSoNMvd3rrYV8/DZvGruFIbNwoPMGbd3wVxo/5Mfg58ePOFgPjA
	 5Mkf1iScx8aLbesjtDl8r5KLgAXchkoNbJ4gdc4bjUIbjZGJK1HPRTNu/GItiMDUiEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dvsn.net;
	spf=pass smtp.mailfrom=mt71.dvsn.net;
	dkim=pass header.d=smtp.mailtrap.live header.i=@smtp.mailtrap.live header.a=rsa-sha256 header.s=rwmt1 header.b=qB2XrUIH;
	dkim=temperror header.d=dvsn.net header.i=@dvsn.net header.a=rsa-sha256 header.s=rwmt1 header.b=KB+ZoUAJ;
	arc=none smtp.remote-ip=45.158.83.2
Received: from smtp-83-2.mailtrap.live (smtp-83-2.mailtrap.live [45.158.83.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D0F606A336
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 17:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2D0F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dvsn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt71.dvsn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=smtp.mailtrap.live header.i=@smtp.mailtrap.live header.a=rsa-sha256 header.s=rwmt1 header.b=qB2XrUIH;
	dkim=temperror header.d=dvsn.net header.i=@dvsn.net header.a=rsa-sha256 header.s=rwmt1 header.b=KB+ZoUAJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; x=1794333323;
	d=smtp.mailtrap.live; s=rwmt1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 feedback-id:cfbl-address:from;
	bh=w3R4NWkzAVN6bv243bgvKvls0Ew5K6M+j/b7qLFiaX4=;
	b=qB2XrUIHGaO7PAQa0Ngzi027go59IJ4Sx2aNtydwja/Y6YVWgOjWGKuYzVyPlo/gvncwrz/Oo2k43
	 9tZU9AWuPNKRhg80Os5j8+o6oxnrHgSXnImqY5hjI0XDeZcBdpw8qk0/Nk0xOlWjW9a2aUu+paAsqM
	 TSlCP8im59xqPcOK/94UYbP17S5YJBACMXV3rKN3ymNGB8BqFHgKS9ip2axexaZTg4z1UzeE0dhD9m
	 hEl1AHzlQForFBt2HEHV6IrBI9L8k4ZNI7ts/3VFWjc1ZqoGD4neKotdmdP+oyThuTkBkud3NWTAX4
	 iTJFRBMndL0y9Gn01QWU18pLL4a3vgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; x=1794333323;
	d=dvsn.net; s=rwmt1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 feedback-id:cfbl-address:from;
	bh=w3R4NWkzAVN6bv243bgvKvls0Ew5K6M+j/b7qLFiaX4=;
	b=KB+ZoUAJxqrWiE9w03xEqVXq0CMYGZUgccOml+PCF8Uvk63xDFOIKPn3Q7Abu1Er59bK2UX7wyNzM
	 WgOfgX7qhl4/kkLB2Q4mUSj334d1Q04QeXQPY5hHvyIC29wRxXGyUSXpCYpl+ThqDIcqaSl5AgkBH/
	 Kyme4OBYoWD6HEYNvQPaulWocgKiaLF0FOc75KxEmT9EqIW0I4gQNoBl7Kpj5cuOEHN4NXGdFmYXe6
	 7aZej2FP3/ZyiUfmfwa020EizZuXOjzTizV1hNfwmAv8/g7e0ecJkI6T35CQCDADLuDTE71o6PBfMv
	 /aGhYrPiSuE/U/w6PRG1SzlwN2LUyig==
CFBL-Address: fbl@smtp.mailtrap.live; report=arf
X-Report-Abuse-To: abuse@mailtrap.io
Received: from dvsn.net by smtp.mailtrap.live with ESMTPSA
 3bed8736-da0b-11f1-9202-0effe0a7bb05; Fri, Nov 06 2026 17:55:23 GMT
Feedback-ID: default:529932:transactional:mailtrap.io
X-Mt-Data: ooHbNoje95qEOIDTPQorIFou0yjPVqCGieCFIVNgK4lIExqA5UKK5hbIOxAzFO_zeis1dMe95DKwGXhZRkjtNgx6dUeY5zpuUzqB5bXMebyNhsbVwzNAIqLCbYkPr6gBxzg2UfKo9wFs994nRqMpFIC7o7da.8dwRzWNI02x9ik.kAf2fYh.MibWZ1mfo_jmkT9nnUesnl_jkuvCsw8F7nRZ0L8FKwVZ83FWP4wXi9iOh80--zyZkfk0.Qb3ef.nV--k.ooMerc7i0zXQHBAjTRRw
From: Andrew Davison <andy@dvsn.net>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Davison <andy@dvsn.net>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda: Fix [codec] ID matching in patch files for IDs with bit 31 set
Date: Fri,  6 Nov 2026 17:55:18 +0000
Message-Id: <20261106175518.18629-1-andy@dvsn.net>
X-Mailer: Mailtrap/1.0
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

parse_codec_mode() reads the vendor and subsystem IDs of a patch file's
[codec] line into an int, and skips the check when the value is zero or
negative, as documented. An ID with bit 31 set, such as SigmaTel's
0x8384xxxx or Intel's 0x8086xxxx, comes out negative, so it is taken as
a wildcard and the section is applied to every codec instead of the one
it names.

This was seen on an OpenPeak OpenFrame 2 with an IDT 92HD75B2X5
(0x111d7608). A patch file written for the STAC9202 (0x83847632) in the
related OpenFrame 1 was applied to it, swapping the headphone and
speaker pin configurations, so auto-mute never muted the speaker.

Read the IDs as long long, so real IDs are compared exactly. Values
written as negative numbers (e.g. -1) still act as wildcards, as
documented; a hex value such as 0xffffffff is now compared as written.

Tested on 6.18.60 on an OpenFrame 2, with a rebuilt snd-hda-codec and
the STAC9202 patch file: user_pin_configs stays empty for the IDT codec,
and the headphone and line-out pins are assigned as the BIOS sets them.
Not tested on a STAC9202 itself.

The bug was tracked down and this fix written with an AI coding
assistant (Claude Code, Claude Opus 5.5), which also ran the tests
above. I have reviewed the change and the tests.

Fixes: ef940b0403d4 ("ALSA: hda - Allow patching with any vendor/subsystem ids")
Cc: stable@vger.kernel.org
Signed-off-by: Andrew Davison <andy@dvsn.net>
---
 sound/hda/common/sysfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/hda/common/sysfs.c b/sound/hda/common/sysfs.c
index bf65223fde10d..b354cbbc3dc91 100644
--- a/sound/hda/common/sysfs.c
+++ b/sound/hda/common/sysfs.c
@@ -512,11 +512,12 @@ static inline int strmatch(const char *a, const char *b)
 static void parse_codec_mode(char *buf, struct hda_bus *bus,
 			     struct hda_codec **codecp)
 {
-	int vendorid, subid, caddr;
+	long long vendorid, subid;
+	int caddr;
 	struct hda_codec *codec;
 
 	*codecp = NULL;
-	if (sscanf(buf, "%i %i %i", &vendorid, &subid, &caddr) == 3) {
+	if (sscanf(buf, "%lli %lli %i", &vendorid, &subid, &caddr) == 3) {
 		list_for_each_codec(codec, bus) {
 			if ((vendorid <= 0 || codec->core.vendor_id == vendorid) &&
 			    (subid <= 0 || codec->core.subsystem_id == subid) &&

base-commit: e0f6c0c60adc73582b40803a5c172077c5a4e84f
-- 
2.39.5 (Apple Git-154)

