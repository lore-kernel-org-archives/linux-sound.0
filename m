Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4916CC0032E
	for <linux-sound@archiver.kernel.org>; Wed, 25 Oct 2023 13:23:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344527AbjJYNXa (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Wed, 25 Oct 2023 09:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235005AbjJYNXX (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Wed, 25 Oct 2023 09:23:23 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D44F1187
        for <linux-sound@vger.kernel.org>; Wed, 25 Oct 2023 06:23:19 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3A4891FF63;
        Wed, 25 Oct 2023 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1698240198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kGBulSRGWyxyBOTbPb/gmBUUbpFOG6EeHDyqZJh39N0=;
        b=DjZGmvs8aEGB3E4k8dyjKoZCz/vB7if78vRouNiwSzGHfr9tpIA3jszq5KcABD7ESrC9vt
        ZnV2SjYxzRIUgJ0ViWvYv4tI1U80JsCkzvx4P9v1I6ZEWYQPYMzhOPM+05lKi5Q7yk0j3f
        i5S9tDtn2Att0dPnZA8egjeB3ygMkMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1698240198;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kGBulSRGWyxyBOTbPb/gmBUUbpFOG6EeHDyqZJh39N0=;
        b=T4Owyhkhefn0TaQFlxTVyu8FiOOUFrCtATIgC0iVVibvMZBQE8l7VY/bta5KMx+OyKnUKX
        qHP/JrRhBe45AfDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2155C13A9E;
        Wed, 25 Oct 2023 13:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id EFOfB8YWOWULeQAAMHmgww
        (envelope-from <tiwai@suse.de>); Wed, 25 Oct 2023 13:23:18 +0000
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-sound@vger.kernel.org
Subject: [PATCH 05/11] ALSA: mixart: Replace with __packed attribute
Date:   Wed, 25 Oct 2023 15:23:08 +0200
Message-Id: <20231025132314.5878-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231025132314.5878-1-tiwai@suse.de>
References: <20231025132314.5878-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
        none
X-Spamd-Result: default: False [-2.10 / 50.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         R_MISSING_CHARSET(2.50)[];
         MIME_GOOD(-0.10)[text/plain];
         TO_DN_NONE(0.00)[];
         BROKEN_CONTENT_TYPE(1.50)[];
         RCPT_COUNT_ONE(0.00)[1];
         NEURAL_HAM_LONG(-3.00)[-1.000];
         DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
         NEURAL_HAM_SHORT(-1.00)[-1.000];
         MID_CONTAINS_FROM(1.00)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_TLS_ALL(0.00)[];
         BAYES_HAM(-3.00)[100.00%]
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Replace the old __attribute__((packed)) with the new __packed.
Only cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/mixart/mixart_core.h | 70 +++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/sound/pci/mixart/mixart_core.h b/sound/pci/mixart/mixart_core.h
index d39233e0e070..7c9a9d82d66e 100644
--- a/sound/pci/mixart/mixart_core.h
+++ b/sound/pci/mixart/mixart_core.h
@@ -68,7 +68,7 @@ struct mixart_enum_connector_resp
 	u32  uid_count;
 	u32  current_uid_index;
 	struct mixart_uid uid[MIXART_MAX_PHYS_CONNECTORS];
-} __attribute__((packed));
+} __packed;
 
 
 /* used for following struct */
@@ -81,7 +81,7 @@ struct mixart_audio_info_req
 	u32 line_max_level;    /* float */
 	u32 micro_max_level;   /* float */
 	u32 cd_max_level;      /* float */
-} __attribute__((packed));
+} __packed;
 
 struct mixart_analog_hw_info
 {
@@ -93,7 +93,7 @@ struct mixart_analog_hw_info
 	u32 step_var_level;    /* float */
 	u32 fix_gain;          /* float */
 	u32 zero_var;          /* float */
-} __attribute__((packed));
+} __packed;
 
 struct mixart_digital_hw_info
 {
@@ -101,7 +101,7 @@ struct mixart_digital_hw_info
 	u32   presence;
 	u32   clock;
 	u32   reserved;
-} __attribute__((packed));
+} __packed;
 
 struct mixart_analog_info
 {
@@ -110,27 +110,27 @@ struct mixart_analog_info
 	struct mixart_analog_hw_info line_info;
 	struct mixart_analog_hw_info cd_info;
 	u32                     analog_level_present;
-} __attribute__((packed));
+} __packed;
 
 struct mixart_digital_info
 {
 	u32 type_mask;
 	struct mixart_digital_hw_info aes_info;
 	struct mixart_digital_hw_info adat_info;
-} __attribute__((packed));
+} __packed;
 
 struct mixart_audio_info
 {
 	u32                   clock_type_mask;
 	struct mixart_analog_info  analog_info;
 	struct mixart_digital_info digital_info;
-} __attribute__((packed));
+} __packed;
 
 struct mixart_audio_info_resp
 {
 	u32                 txx_status;
 	struct mixart_audio_info info;
-} __attribute__((packed));
+} __packed;
 
 
 /* used for nb_bytes_max_per_sample */
@@ -142,7 +142,7 @@ struct mixart_stream_info
 	u32 size_max_byte_frame;
 	u32 size_max_sample_frame;
 	u32 nb_bytes_max_per_sample;  /* float */
-} __attribute__((packed));
+} __packed;
 
 /*  MSG_STREAM_ADD_INPUT_GROUP */
 /*  MSG_STREAM_ADD_OUTPUT_GROUP */
@@ -157,13 +157,13 @@ struct mixart_streaming_group_req
 	struct mixart_stream_info stream_info[32];
 	struct mixart_uid connector;
 	u32 flow_entry[32];
-} __attribute__((packed));
+} __packed;
 
 struct mixart_stream_desc
 {
 	struct mixart_uid stream_uid;
 	u32          stream_desc;
-} __attribute__((packed));
+} __packed;
 
 struct mixart_streaming_group
 {
@@ -172,7 +172,7 @@ struct mixart_streaming_group
 	u32                  pipe_desc;
 	u32                  stream_count;
 	struct mixart_stream_desc stream[32];
-} __attribute__((packed));
+} __packed;
 
 /* MSG_STREAM_DELETE_GROUP */
 
@@ -182,7 +182,7 @@ struct mixart_delete_group_resp
 {
 	u32  status;
 	u32  unused[2];
-} __attribute__((packed));
+} __packed;
 
 
 /* 	MSG_STREAM_START_INPUT_STAGE_PACKET  = 0x130000 + 7,
@@ -195,7 +195,7 @@ struct mixart_fx_couple_uid
 {
 	struct mixart_uid uid_fx_code;
 	struct mixart_uid uid_fx_data;
-} __attribute__((packed));
+} __packed;
 
 struct mixart_txx_stream_desc
 {
@@ -203,14 +203,14 @@ struct mixart_txx_stream_desc
 	u32                     stream_idx;
 	u32                     fx_number;
 	struct mixart_fx_couple_uid  uid_fx[4];
-} __attribute__((packed));
+} __packed;
 
 struct mixart_flow_info
 {
 	struct mixart_txx_stream_desc  stream_desc;
 	u32                       flow_entry;
 	u32                       flow_phy_addr;
-} __attribute__((packed));
+} __packed;
 
 struct mixart_stream_state_req
 {
@@ -219,7 +219,7 @@ struct mixart_stream_state_req
 	u32                 reserved4np[3];
 	u32                 stream_count;  /* set to 1 for instance */
 	struct mixart_flow_info  stream_info;   /* could be an array[stream_count] */
-} __attribute__((packed));
+} __packed;
 
 /* 	MSG_STREAM_START_STREAM_GRP_PACKET   = 0x130000 + 6
 	MSG_STREAM_STOP_STREAM_GRP_PACKET    = 0x130000 + 9
@@ -232,13 +232,13 @@ struct mixart_group_state_req
 	u32           reserved4np[2];
 	u32           pipe_count;    /* set to 1 for instance */
 	struct mixart_uid  pipe_uid; /* could be an array[pipe_count], in theory */
-} __attribute__((packed));
+} __packed;
 
 struct mixart_group_state_resp
 {
 	u32           txx_status;
 	u64           scheduler;
-} __attribute__((packed));
+} __packed;
 
 
 
@@ -250,7 +250,7 @@ struct mixart_sample_pos
 	u32   validity;
 	u32   sample_pos_high_part;
 	u32   sample_pos_low_part;
-} __attribute__((packed));
+} __packed;
 
 /*
  * This structure is limited by the size of MSG_DEFAULT_SIZE. Instead of
@@ -263,7 +263,7 @@ struct mixart_timer_notify
 {
 	u32                  stream_count;
 	struct mixart_sample_pos  streams[MIXART_MAX_TIMER_NOTIFY_STREAMS];
-} __attribute__((packed));
+} __packed;
 
 
 /*	MSG_CONSOLE_GET_CLOCK_UID            = 0x070003,
@@ -275,7 +275,7 @@ struct mixart_return_uid
 {
 	u32 error_code;
 	struct mixart_uid uid;
-} __attribute__((packed));
+} __packed;
 
 /*	MSG_CLOCK_CHECK_PROPERTIES           = 0x200001,
 	MSG_CLOCK_SET_PROPERTIES             = 0x200002,
@@ -315,13 +315,13 @@ struct mixart_clock_properties
 	u32 board_mask;
 	u32 nb_callers; /* set to 1 (see below) */
 	struct mixart_uid uid_caller;
-} __attribute__((packed));
+} __packed;
 
 struct mixart_clock_properties_resp
 {
 	u32 status;
 	u32 clock_mode;
-} __attribute__((packed));
+} __packed;
 
 
 /*	MSG_STREAM_SET_INPUT_STAGE_PARAM     = 0x13000F */
@@ -402,7 +402,7 @@ struct mixart_stream_param_desc
 	u32 pipe_count;                           /* set to 1 (array size !) */
 	u32 stream_count;                         /* set to 1 (array size !) */
 	struct mixart_txx_stream_desc stream_desc; /* only one stream per command, but this could be an array, in theory */
-} __attribute__((packed));
+} __packed;
 
 
 /*	MSG_CONNECTOR_GET_OUT_AUDIO_LEVEL    = 0x050009,
@@ -418,7 +418,7 @@ struct mixart_get_out_audio_level
 	u32 mute;
 	u32 monitor_mute1;
 	u32 monitor_mute2;
-} __attribute__((packed));
+} __packed;
 
 
 /*	MSG_CONNECTOR_SET_OUT_AUDIO_LEVEL    = 0x05000A,
@@ -445,7 +445,7 @@ struct mixart_set_out_audio_level
 	u32 monitor_mute1;
 	u32 monitor_mute2;
 	u32 reserved4np;
-} __attribute__((packed));
+} __packed;
 
 
 /*	MSG_SYSTEM_ENUM_PHYSICAL_IO          = 0x16000E,
@@ -460,7 +460,7 @@ struct mixart_uid_enumeration
 	u32 nb_uid;
 	u32 current_uid_index;
 	struct mixart_uid uid[MIXART_MAX_PHYS_IO];
-} __attribute__((packed));
+} __packed;
 
 
 /*	MSG_PHYSICALIO_SET_LEVEL             = 0x0F0008,
@@ -471,13 +471,13 @@ struct mixart_io_channel_level
 {
 	u32 analog_level;   /* float */
 	u32 unused[2];
-} __attribute__((packed));
+} __packed;
 
 struct mixart_io_level
 {
 	s32 channel; /* 0=left, 1=right, -1=both, -2=both same */
 	struct mixart_io_channel_level level[2];
-} __attribute__((packed));
+} __packed;
 
 
 /*	MSG_STREAM_SET_IN_AUDIO_LEVEL        = 0x130015,
@@ -490,7 +490,7 @@ struct mixart_in_audio_level_info
 	u32 valid_mask2;
 	u32 digital_level;
 	u32 analog_level;
-} __attribute__((packed));
+} __packed;
 
 struct mixart_set_in_audio_level_req
 {
@@ -499,7 +499,7 @@ struct mixart_set_in_audio_level_req
 	u32 audio_count;  /* set to <= 2 */
 	u32 reserved4np;
 	struct mixart_in_audio_level_info level[2];
-} __attribute__((packed));
+} __packed;
 
 /* response is a 32 bit status */
 
@@ -529,13 +529,13 @@ struct mixart_out_stream_level_info
 	u32 digital_level2;
 	u32 mute1;
 	u32 mute2;
-} __attribute__((packed));
+} __packed;
 
 struct mixart_set_out_stream_level
 {
 	struct mixart_txx_stream_desc desc;
 	struct mixart_out_stream_level_info out_level;
-} __attribute__((packed));
+} __packed;
 
 struct mixart_set_out_stream_level_req
 {
@@ -544,7 +544,7 @@ struct mixart_set_out_stream_level_req
 	u32 reserved4np[2];
 	u32 nb_of_stream;  /* set to 1 */
 	struct mixart_set_out_stream_level stream_level; /* could be an array */
-} __attribute__((packed));
+} __packed;
 
 /* response to this request is a u32 status value */
 
-- 
2.35.3

