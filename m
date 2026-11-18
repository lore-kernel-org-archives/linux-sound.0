Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028643;
	b=B33XDqKXe8I1Ui03h/jFRFdnaC3IVcDhh0VM6QH96OGJN5FaFBbbst6m4vo1EsFi47Ps
	 WtNCl+IuGj2ChK0YnU+IbMVq3SmsC+K1WtK1BgsE2khCkGFJUhM+OzGZX+WiS9KN4884I
	 VUFp4csPnr1TC2wSZja9u2ACjRALrekIb2pYSC+FI68FbRg25gI8ARcfdvQfqPhg1DlJp
	 aOWuJkkwSkqYdcRXAtLKVQ4oWYhOmETkU7VcieHvZlqKrkcSFLIi+O9gqcC5z8ExwbvQn
	 Yq0hkFCYJAMUlLkbQZCkYpLMoIVYCLnbHoPuC+0YEoqvijglL+9vpOcGCION0SMv2Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028643;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LEmGn1W3opGrDsz4s0+f+/l4y+BXAoN+xzPfLWle0/c=;
	b=xK7uSi91oMPWYf13OWu5Wxu5L1RhKaRbWXsJK+eqVTgVBcP5UFaTzm7MB0B2IqYGvS6A
	 FekKz4Xcz7/niIlG1vaN5s30zX7J5hOGqTdc3V3M0TkvCkUfeu/qVYA/rFjl7H94k47cZ
	 X4Pcmx3UNdrJMAV315MiGbFHO0Oj2ZFvv09Hxoon6Tbav7ksjgNhMSzOk/8wn47NgySlm
	 VbRcv5rX8sg92Oaf4H0tr7yuMjmrTJhsjMnnXEToi5bQ4ENoTNiHL3tcf3Ng5k9+gQ4Ki
	 nK5aSRyrCY30grlVOQiSspcSp++egvo6/2Ywq7TEOTF53cdZ+BJXzJI3qngs8yfofvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=Z6o0J5++;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACAF606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DACAF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=Z6o0J5++
X-Virus-Scanned: by amavisd-new using ClamAV (7)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028641;
	bh=LEmGn1W3opGrDsz4s0+f+/l4y+BXAoN+xzPfLWle0/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z6o0J5++3qN0Dg55kSfo2qDf8P4LDLLNDcZE1e3zJPpAW4bHbIi7lXlO1ufVQyPjQ
	 jIgV861WHtuM6LzlwwBb2NFDh4Lwo8j+xceQHYnybO7IfTabw3EmlN4eqq8IYp4f28
	 AnuKYJFl4m45Q8hqUeUJK0E6g9svrvb000TnDPchJfTlHQ3TnM2t6QBFafjD1NOXpD
	 grCbLJ621y5WxTn1yP+LFRN5nnzow7DQilABCtPGbM9v7qX6ZFKIm3rx5QKnKrB+y0
	 p9nkG7lYXPo949uw4WCyN8GFjuENMhM2CqfGd9EFdrHxiUeuSAQsWU8ntiy2NRcdoS
	 hrxloNbJSYeCw==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 1AD481BDD77;
	Wed, 18 Nov 2026 20:04:01 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 16/22] ASoC: Intel: atom: Remove orphaned function prototypes from sst.h
Date: Wed, 18 Nov 2026 20:02:13 +0100
Message-ID: <20261118190219.316811-17-amade@asmblr.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118190219.316811-1-amade@asmblr.net>
References: <20261118190219.316811-1-amade@asmblr.net>
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

sst_set_stream_param(), sst_set_metadata(), sst_load_library(),
sst_get_block_stream(), intel_sst_register_compress(),
intel_sst_remove_compress(), sst_send_sync_msg(),
sst_restore_fw_context(), sst_request_firmware_async() and
sst_get_acpi_driver_data() have no implementation in the tree. Remove
their orphaned prototypes from sst.h.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/intel/atom/sst/sst.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst.h b/sound/soc/intel/atom/sst/sst.h
index e24d9dad7ef6..4c759ba377ae 100644
--- a/sound/soc/intel/atom/sst/sst.h
+++ b/sound/soc/intel/atom/sst/sst.h
@@ -439,8 +439,6 @@ int sst_free_stream(struct intel_sst_drv *sst_drv_ctx, int str_id);
 int sst_start_stream(struct intel_sst_drv *sst_drv_ctx, int str_id);
 int sst_send_byte_stream_mrfld(struct intel_sst_drv *sst_drv_ctx,
 			struct snd_sst_bytes_v2 *bytes);
-int sst_set_stream_param(int str_id, struct snd_sst_params *str_param);
-int sst_set_metadata(int str_id, char *params);
 int sst_get_stream(struct intel_sst_drv *ctx,
 		struct snd_sst_params *str_param);
 int sst_drain_stream(struct intel_sst_drv *sst_drv_ctx,
@@ -453,9 +451,7 @@ int intel_sst_reset_dsp_mrfld(struct intel_sst_drv *sst_drv_ctx);
 void intel_sst_clear_intr_mrfld(struct intel_sst_drv *sst_drv_ctx);
 
 int sst_load_fw(struct intel_sst_drv *sst_drv_ctx);
-int sst_load_library(struct snd_sst_lib_download *lib, u8 ops);
 void sst_post_download_mrfld(struct intel_sst_drv *ctx);
-int sst_get_block_stream(struct intel_sst_drv *sst_drv_ctx);
 void sst_memcpy_free_resources(struct intel_sst_drv *sst_drv_ctx);
 
 int sst_wait_timeout(struct intel_sst_drv *sst_drv_ctx,
@@ -463,13 +459,9 @@ int sst_wait_timeout(struct intel_sst_drv *sst_drv_ctx,
 int sst_create_ipc_msg(struct ipc_post **arg, bool large);
 int free_stream_context(struct intel_sst_drv *ctx, unsigned int str_id);
 void sst_clean_stream(struct stream_info *stream);
-int intel_sst_register_compress(struct intel_sst_drv *sst);
-int intel_sst_remove_compress(struct intel_sst_drv *sst);
-int sst_send_sync_msg(int ipc, int str_id);
 int sst_get_num_channel(struct snd_sst_params *str_param);
 int sst_get_sfreq(struct snd_sst_params *str_param);
 int sst_alloc_stream_mrfld(struct intel_sst_drv *sst_drv_ctx, void *params);
-void sst_restore_fw_context(void);
 struct sst_block *sst_create_block(struct intel_sst_drv *ctx,
 				u32 msg_id, u32 drv_id);
 int sst_create_block_and_ipc_msg(struct ipc_post **arg, bool large,
@@ -478,9 +470,7 @@ int sst_create_block_and_ipc_msg(struct ipc_post **arg, bool large,
 int sst_free_block(struct intel_sst_drv *ctx, struct sst_block *freed);
 int sst_wake_up_block(struct intel_sst_drv *ctx, int result,
 		u32 drv_id, u32 ipc, void *data, u32 size);
-int sst_request_firmware_async(struct intel_sst_drv *ctx);
 int sst_driver_ops(struct intel_sst_drv *sst);
-struct sst_platform_info *sst_get_acpi_driver_data(const char *hid);
 void sst_firmware_load_cb(const struct firmware *fw, void *context);
 int sst_prepare_and_post_msg(struct intel_sst_drv *sst,
 		int task_id, int ipc_msg, int cmd_id, int pipe_id,
-- 
2.56.1

