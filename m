Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943D347AF4B;
	Wed,  1 Apr 2026 16:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062723; cv=none; b=ttkqikbUgZPL43N5ATnC9he1pb0/3dlKCYYV0rPJdhJJsix8APlB7lrsNw4rx/i6QilTtw/ht4CV9XgIE2GZWIWBGzF7l63tI/0vlpz01r/QYP41WwXqVPUJOO6+2aOsYMFMFfwG6ORNw7rR7q7S6ilTGhD/DtkhsKLa9Uzoc+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062723; c=relaxed/simple;
	bh=UH+qdpBPJqbMLYyHXCvmidYGGfC2Ju8ySxnGq1Tsiik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNsBEo71UYHbi9CZuei1bUS9n+AjFWA9xH/9mEiIxDp7i1Vw5TdoaDV+gawfPhfn7AlrqnR/YT/rubi0i/EavdS6GWEh8AzSV8x5WzBigUIoT4JnkNYTDtibFgzjc4z0Zr10cOMQ+yJy981ivi+cO0zH5BkfbdvPtgrAAJTvioQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqN9Q+gG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqN9Q+gG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F4EC4CEF7;
	Wed,  1 Apr 2026 16:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775062723;
	bh=UH+qdpBPJqbMLYyHXCvmidYGGfC2Ju8ySxnGq1Tsiik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IqN9Q+gGpwUvnNxS1ea+S37v4eV3tzpX8rsTjHSU2+5/chE84v9v3n3kRVmawufAA
	 VAgu2nDCATeb+3TbFrD53NLa64rQOKEMnAtW2kdQp8T9TNyW/MQb+c2VJ9fnO3Ijpt
	 IEKDzFNP8t7tIy3Kkyl+1XSzBcSJ0mG54jh+QsXQ8UZubPSIyjwsp6rRpwChcFmWDk
	 LsJV00AC2HODSR7eOROoVEivYFD28+qepLTOeDKc+s+c6h9fR8OK1zjdzKiT/uvJmL
	 em5Y1mr053wcViWKCpt8PNe9Y2r/fmfPYII3Vrmj9p/uIwDFH6xMVZY8ujNnevQ2dI
	 uelGFVPeo48bQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 01 Apr 2026 17:57:35 +0100
Subject: [PATCH 2/2] ALSA: compress: Pay attention if drivers error out
 retrieving pointers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-alsa-unconfigured-tstamp-v1-2-694c2cb5f71d@kernel.org>
References: <20260401-alsa-unconfigured-tstamp-v1-0-694c2cb5f71d@kernel.org>
In-Reply-To: <20260401-alsa-unconfigured-tstamp-v1-0-694c2cb5f71d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev-7777e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UH+qdpBPJqbMLYyHXCvmidYGGfC2Ju8ySxnGq1Tsiik=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpzU69HXqsp+0RX0Tk6XsDBR/I1N4EzcTa4V6bw
 tyJoLbq7wCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac1OvQAKCRAk1otyXVSH
 0GMdB/43zEUp2B8CoNOkRjhNLVg2gJgZ5OGAR7/KgYS6DhRxOSR4l2OQCDwNS4IeOPFGmy8Y8nW
 eP3JB0IU7B/pR+00c7UUOB4h+Ofp4+4jr9IcGs93SL8PHGrD9KYsQ3irPc1STULQAg3VnzO/WPQ
 gKfr06No9SrWygysmutsg/TMSgfRl5DT332OVZl+g8gXh3VEAABHJ0XdkeKFQP4Medl0k1axIzF
 AY6uMRNfR271IJTOg7ESonjVdJNna9cJjfikMl3jmdl54ye2e5CKY0So6q2VRUNQZQEBR+MBS60
 kLPhxDsuakZX1RTmmqwGH/j0EDh/AKaQ1K4kJAuQTmRIwVWH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Currently we have a return code on the driver pointer operation but the
core ignores that. Let's start paying attention.

Reported-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/core/compress_offload.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 67b3b1a3b526..c91547451311 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -190,6 +190,8 @@ snd_compr_tstamp32_from_64(struct snd_compr_tstamp *tstamp32,
 static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 				   struct snd_compr_tstamp64 *tstamp)
 {
+	int ret;
+
 	if (!stream->ops->pointer)
 		return -ENOTSUPP;
 
@@ -200,7 +202,9 @@ static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 		break;
 	}
 
-	stream->ops->pointer(stream, tstamp);
+	ret = stream->ops->pointer(stream, tstamp);
+	if (ret != 0)
+		return ret;
 	pr_debug("dsp consumed till %u total %llu bytes\n", tstamp->byte_offset,
 		 tstamp->copied_total);
 	if (stream->direction == SND_COMPRESS_PLAYBACK)

-- 
2.47.3

